import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateScheduleDto, UpdateScheduleDto } from './dto/schedule.dto';

@Injectable()
export class SchedulesService {
  constructor(private readonly prisma: PrismaService) {}

  async create(housemaidId: string, createScheduleDto: CreateScheduleDto) {
    const housemaid = await this.prisma.housemaids.findUnique({
      where: { id: housemaidId },
    });

    if (!housemaid) {
      throw new NotFoundException(`Housemaid with ID "${housemaidId}" not found`);
    }

    return this.prisma.schedules.create({
      data: {
        ...createScheduleDto,
        housemaidId: housemaidId,
      },
    });
  }

  async findAllByHousemaid(housemaidId: string) {
    const housemaid = await this.prisma.housemaids.findUnique({
      where: { id: housemaidId },
    });

    if (!housemaid) {
      throw new NotFoundException(`Housemaid with ID "${housemaidId}" not found`);
    }

    return this.prisma.schedules.findMany({
      where: { housemaidId },
      orderBy: {
        dayOfWeek: 'asc',
      },
    });
  }

  async update(scheduleId: string, updateScheduleDto: UpdateScheduleDto) {
    const schedule = await this.prisma.schedules.findUnique({
      where: { id: scheduleId },
    });

    if (!schedule) {
      throw new NotFoundException(`Schedule with ID "${scheduleId}" not found`);
    }

    return this.prisma.schedules.update({
      where: { id: scheduleId },
      data: updateScheduleDto,
    });
  }

  async remove(scheduleId: string) {
    const schedule = await this.prisma.schedules.findUnique({
      where: { id: scheduleId },
    });

    if (!schedule) {
      throw new NotFoundException(`Schedule with ID "${scheduleId}" not found`);
    }

    return this.prisma.schedules.delete({
      where: { id: scheduleId },
    });
  }
}
