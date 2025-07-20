import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateCustomerDto, UpdateCustomerDto } from './dto/customer.dto';

@Injectable()
export class CustomersService {
  constructor(private readonly prisma: PrismaService) {}

  async findAll() {
    const customers = await this.prisma.customers.findMany({
      include: {
        services: true,
        documents: true,
        supports: true,
        houses: true,
      },
    });

    const avgByCustomer = await this.prisma.evaluations.groupBy({
      by: ['evaluatedEntityId'],
      where: {
        evaluatedEntity: 'customer',
      },
      _avg: {
        score: true,
      },
    });

    const avgMap = new Map(
      avgByCustomer.map((item) => [item.evaluatedEntityId, item._avg.score || 0]),
    );

    const customersWithAvg = customers.map((customer) => ({
      ...customer,
      evaluations_avg: avgMap.get(customer.id) || 0,
    }));

    return customersWithAvg;
  }

  async findOne(id: string) {
    const customer = await this.prisma.customers.findUnique({
      where: { id },
      include: {
        services: true,
        documents: true,
        supports: true,
        houses: true,
      },
    });

    const evaluations_avg = await this.prisma.evaluations.aggregate({
      where: {
        evaluatedEntity: 'customer',
        evaluatedEntityId: id,
      },
      _avg: {
        score: true,
      },
    });

    return {
      ...customer,
      evaluations_avg: evaluations_avg._avg.score || 0,
    };
  }

  create(data: CreateCustomerDto) {
    return this.prisma.customers.create({ data });
  }

  update(id: string, data: UpdateCustomerDto) {
    return this.prisma.customers.update({
      where: { id },
      data,
    });
  }
}
