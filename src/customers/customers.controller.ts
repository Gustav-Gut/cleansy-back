// src/customers/customers.controller.ts
import { Controller, Get, Post, Put, Param, Body } from '@nestjs/common';
import { CustomersService } from './customers.service';
import { CreateCustomerDto, UpdateCustomerDto } from './dto/customer.dto';

@Controller('customers')
export class CustomersController {
  constructor(private readonly customersService: CustomersService) {}

  // Endpoint para crear cliente
  @Post()
  create(@Body() dto: CreateCustomerDto) {
    return this.customersService.create(dto);
  }

  // Endpoint para obtener todos los clientes
  @Get()
  findAll() {
    return this.customersService.findAll();
  }

  // Endpoint para obtener un cliente específico (por cuid)
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.customersService.findOne(id);
  }

  // Endpoint para actualizar un cliente
  @Put(':id')
  update(@Param('id') id: string, @Body() dto: UpdateCustomerDto) {
    return this.customersService.update(id, dto);
  }
}
