import { ConflictException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateHousemaidDto, UpdateHousemaidDto } from './dto/housemaid.dto';

@Injectable()
export class HousemaidsService {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateHousemaidDto) {
    try {
      return await this.prisma.housemaids.create({
        data: data,
      });
    } catch (error) {
      if (error.code === 'P2002') {
        throw new ConflictException('Email already exists');
      }
      throw error;
    }
  }

  async findAll() {
    const housemaids = await this.prisma.housemaids.findMany({
      include: {
        services: true,
        documents: true,
        schedule: true,
      },
    });

    const avgByHousemaid = await this.prisma.evaluations.groupBy({
      by: ['evaluatedEntityId'],
      where: {
        evaluatedEntity: 'housemaid',
      },
      _avg: {
        score: true,
      },
    });

    const avgMap = new Map(
      avgByHousemaid.map((item) => [item.evaluatedEntityId, item._avg.score || 0]),
    );

    const housemaidsWithAvg = housemaids.map((housemaid) => ({
      ...housemaid,
      evaluations_avg: avgMap.get(housemaid.id) || 0,
    }));

    return housemaidsWithAvg;
  }

  async findOne(id: string) {
    const housemaid = await this.prisma.housemaids.findUnique({
      where: { id },
      include: {
        services: true,
        documents: true,
        schedule: true,
      },
    });

    if (!housemaid) {
      throw new NotFoundException(`Housemaid with ID "${id}" not found`);
    }

    const evaluations_avg = await this.prisma.evaluations.aggregate({
      where: {
        evaluatedEntity: 'housemaid',
        evaluatedEntityId: id,
      },
      _avg: {
        score: true,
      },
    });

    return {
      ...housemaid,
      evaluations_avg: evaluations_avg._avg.score || 0,
    };
  }

  async update(id: string, updatedData: UpdateHousemaidDto) {
    try {
      return this.prisma.housemaids.update({
        where: { id },
        data: updatedData,
      });
    } catch (error) {
      if (error.code === 'P2025') {
        throw new NotFoundException(`Housemaid with ID ${id} not found`);
      }
      throw error;
    }
  }
}
