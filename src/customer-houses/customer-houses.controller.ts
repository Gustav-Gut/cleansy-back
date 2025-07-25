import { Controller, Get, Post, Body, Param, Patch } from '@nestjs/common';
import { CustomerHousesService } from './customer-houses.service';
import { CreateCustomerHouseDto, UpdateCustomerHouseDto } from './dto/customer-house.dto';

@Controller('customers/:customerId/houses')
export class CustomerHousesController {
  constructor(private readonly customerHousesService: CustomerHousesService) {}

  @Post()
  create(
    @Param('customerId') customerId: string,
    @Body() createCustomerHouseDto: CreateCustomerHouseDto,
  ) {
    return this.customerHousesService.create(customerId, createCustomerHouseDto);
  }

  @Get()
  findAll(@Param('customerId') customerId: string) {
    return this.customerHousesService.findAllByCustomer(customerId);
  }

  @Patch(':houseId')
  update(
    @Param('houseId') houseId: string,
    @Body() updateCustomerHouseDto: UpdateCustomerHouseDto,
  ) {
    return this.customerHousesService.update(houseId, updateCustomerHouseDto);
  }
}
