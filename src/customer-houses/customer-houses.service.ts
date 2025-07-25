import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateCustomerHouseDto, UpdateCustomerHouseDto } from './dto/customer-house.dto';
import { Prisma } from '@prisma/client';

@Injectable()
export class CustomerHousesService {
  constructor(private readonly prisma: PrismaService) {}

  async create(customerId: string, createCustomerHouseDto: CreateCustomerHouseDto) {
    const customer = await this.prisma.customers.findUnique({
      where: { id: customerId },
    });

    if (!customer) {
      throw new NotFoundException(`Customer with ID "${customerId}" not found`);
    }

    const { distribution, ...restOfDto } = createCustomerHouseDto;

    return this.prisma.customerHouses.create({
      data: {
        ...restOfDto,
        distribution: distribution as unknown as Prisma.JsonObject,
        customerId: customerId,
      },
    });
  }

  async findAllByCustomer(customerId: string) {
    const customer = await this.prisma.customers.findUnique({
      where: { id: customerId },
    });

    if (!customer) {
      throw new NotFoundException(`Customer with ID "${customerId}" not found`);
    }

    return this.prisma.customerHouses.findMany({
      where: { customerId },
    });
  }

  async update(houseId: string, updateCustomerHouseDto: UpdateCustomerHouseDto) {
    const existingHouse = await this.prisma.customerHouses.findUnique({
      where: { id: houseId },
    });

    if (!existingHouse) {
      throw new NotFoundException(`House with ID "${houseId}" not found`);
    }

    const { distribution, ...restOfDto } = updateCustomerHouseDto;

    const dataToUpdate: Prisma.CustomerHousesUpdateInput = {
      ...restOfDto,
      distribution: distribution as unknown as Prisma.JsonObject,
    };

    return this.prisma.customerHouses.update({
      where: { id: houseId },
      data: dataToUpdate,
    });
  }
}
