import { PartialType } from '@nestjs/mapped-types';
import { DayOfWeek } from '@prisma/client';
import { IsEnum, IsNotEmpty, IsString, Matches } from 'class-validator';

export class CreateScheduleDto {
  @IsEnum(DayOfWeek)
  @IsNotEmpty()
  dayOfWeek: DayOfWeek;

  @IsString()
  @IsNotEmpty()
  @Matches(/^([01]\d|2[0-3]):([0-5]\d)$/, {
    message: 'startTime must be in HH:mm format (e.g., 09:00)',
  })
  startTime: string;

  @IsString()
  @IsNotEmpty()
  @Matches(/^([01]\d|2[0-3]):([0-5]\d)$/, {
    message: 'endTime must be in HH:mm format (e.g., 17:30)',
  })
  endTime: string;
}

export class UpdateScheduleDto extends PartialType(CreateScheduleDto) {}
