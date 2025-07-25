import { Controller, Get, Post, Body, Param, Delete, Patch } from '@nestjs/common';
import { SchedulesService } from './schedules.service';
import { CreateScheduleDto, UpdateScheduleDto } from './dto/schedule.dto';

@Controller('housemaids/:housemaidId/schedules')
export class SchedulesController {
  constructor(private readonly schedulesService: SchedulesService) {}

  @Post()
  create(
    @Param('housemaidId') housemaidId: string,
    @Body() createScheduleDto: CreateScheduleDto,
  ) {
    return this.schedulesService.create(housemaidId, createScheduleDto);
  }

  @Get()
  findAll(@Param('housemaidId') housemaidId: string) {
    return this.schedulesService.findAllByHousemaid(housemaidId);
  }

  @Patch(':scheduleId')
  update(
    @Param('scheduleId') scheduleId: string,
    @Body() updateScheduleDto: UpdateScheduleDto,
  ) {
    return this.schedulesService.update(scheduleId, updateScheduleDto);
  }

  @Delete(':scheduleId')
  remove(@Param('scheduleId') scheduleId: string) {
    return this.schedulesService.remove(scheduleId);
  }
}
