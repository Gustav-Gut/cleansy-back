import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { TypesServicesService } from './types-services.service';
import { CreateTypesServiceDto, UpdateTypesServiceDto } from './dto/types-service.dto';

@Controller('types-services')
export class TypesServicesController {
  constructor(private readonly typesServicesService: TypesServicesService) {}

  @Post()
  create(@Body() createTypesServiceDto: CreateTypesServiceDto) {
    return this.typesServicesService.create(createTypesServiceDto);
  }

  @Get()
  findAll() {
    return this.typesServicesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.typesServicesService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateTypesServiceDto: UpdateTypesServiceDto) {
    return this.typesServicesService.update(id, updateTypesServiceDto);
  }
}
