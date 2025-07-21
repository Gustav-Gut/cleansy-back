import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { HousemaidsService } from './housemaids.service';
import { CreateHousemaidDto, UpdateHousemaidDto } from './dto/housemaid.dto';

@Controller('housemaids')
export class HousemaidsController {
  constructor(private readonly housemaidsService: HousemaidsService) {}

  @Post()
  create(@Body() data: CreateHousemaidDto) {
    return this.housemaidsService.create(data);
  }

  @Get()
  findAll() {
    return this.housemaidsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.housemaidsService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updatedData: UpdateHousemaidDto) {
    return this.housemaidsService.update(id, updatedData);
  }
}
