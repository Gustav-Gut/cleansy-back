import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateServiceDto, UpdateServiceDto } from './dto/service.dto';

@Injectable()
export class ServicesService {
  constructor(private readonly prisma: PrismaService) {}

  create(createServiceDto: CreateServiceDto) {
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
        schedule: true,
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
        schedule: true,
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
}
