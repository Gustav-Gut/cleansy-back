import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateTypesServiceDto, UpdateTypesServiceDto } from './dto/types-service.dto';

@Injectable()
export class TypesServicesService {
  constructor(private readonly prisma: PrismaService) {}

  create(createTypesServiceDto: CreateTypesServiceDto) {
    return this.prisma.typesServices.create({
      data: createTypesServiceDto,
    });
  }

  findAll() {
    return this.prisma.typesServices.findMany({
      include: {
        housemaids: {
          select: {
            id: true,
            name: true,
            lastname: true,
          },
        },
      },
    });
  }

  async findOne(id: string) {
    const typeService = await this.prisma.typesServices.findUnique({
      where: { id },
      include: {
        housemaids: true,
      },
    });

    if (!typeService) {
      throw new NotFoundException(`Type of Service with ID "${id}" not found`);
    }
    return typeService;
  }

  update(id: string, updateTypesServiceDto: UpdateTypesServiceDto) {
    return this.prisma.typesServices.update({
      where: { id },
      data: updateTypesServiceDto,
    });
  }
}
