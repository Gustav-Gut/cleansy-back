import {
  BadRequestException,
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateServiceDto, UpdateServiceDto } from './dto/service.dto';
import { getDay } from 'date-fns';

@Injectable()
export class ServicesService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createServiceDto: CreateServiceDto) {
    const { housemaidId, initialDate, endDate } = createServiceDto;

    const housemaid = await this.prisma.housemaids.findUnique({
      where: { id: housemaidId },
      include: { schedules: true },
    });

    if (!housemaid) {
      throw new NotFoundException(`Housemaid with ID "${housemaidId}" not found`);
    }

    const isAvailable = this.checkAvailability(housemaid.schedules, initialDate, endDate);
    if (!isAvailable) {
      throw new BadRequestException(
        `The housemaid is not available in the selected time slot.`,
      );
    }

    const conflictingService = await this.prisma.services.findFirst({
      where: {
        housemaidId: housemaidId,
        initialDate: {
          lt: endDate,
        },
        endDate: {
          gt: initialDate,
        },
      },
    });

    if (conflictingService) {
      throw new ConflictException(
        `The housemaid already has a service scheduled at this time.`,
      );
    }

    return this.prisma.services.create({
      data: createServiceDto,
    });
  }

  findAll() {
    return this.prisma.services.findMany({
      include: {
        customer: true,
        housemaid: true,
        typeService: true,
      },
    });
  }

  async findOne(id: string) {
    const service = await this.prisma.services.findUnique({
      where: { id },
      include: {
        customer: true,
        housemaid: true,
        typeService: true,
      },
    });

    if (!service) {
      throw new NotFoundException(`Service with ID "${id}" not found`);
    }
    return service;
  }

  update(id: string, updateServiceDto: UpdateServiceDto) {
    return this.prisma.services.update({
      where: { id },
      data: updateServiceDto,
    });
  }

  private checkAvailability(schedules: any[], initialDate: Date, endDate: Date): boolean {
    const serviceDay = getDay(initialDate); // Domingo = 0, Lunes = 1, etc.
    const serviceStartTime = initialDate.toTimeString().substring(0, 5); // Formato "HH:mm"
    const serviceEndTime = endDate.toTimeString().substring(0, 5); // Formato "HH:mm"

    const dayMap = [
      'SUNDAY',
      'MONDAY',
      'TUESDAY',
      'WEDNESDAY',
      'THURSDAY',
      'FRIDAY',
      'SATURDAY',
    ];
    const serviceDayString = dayMap[serviceDay];

    const availableSlot = schedules.find(
      (slot) =>
        slot.dayOfWeek === serviceDayString &&
        slot.startTime <= serviceStartTime &&
        slot.endTime >= serviceEndTime,
    );

    return !!availableSlot;
  }
}
