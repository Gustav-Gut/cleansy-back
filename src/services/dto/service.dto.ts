import { PartialType } from '@nestjs/mapped-types';
import { ServiceStatus } from '@prisma/client';
import { Matches, IsDateString, IsEnum, IsNotEmpty, IsOptional } from 'class-validator';

const CUID_REGEX = /^c[^\s-]{8,}$/i;

export class CreateServiceDto {
  @Matches(CUID_REGEX, { message: 'customerId must be a valid type' })
  @IsNotEmpty()
  customerId: string;

  @Matches(CUID_REGEX, { message: 'housemaidId must be a valid type' })
  @IsNotEmpty()
  housemaidId: string;

  @Matches(CUID_REGEX, { message: 'typeServiceId must be a valid type' })
  @IsNotEmpty()
  typeServiceId: string;

  @IsDateString()
  @IsNotEmpty()
  initialDate: Date;

  @IsDateString()
  @IsNotEmpty()
  endDate: Date;

  @IsOptional()
  @IsEnum(ServiceStatus)
  status?: ServiceStatus;
}

export class UpdateServiceDto extends PartialType(CreateServiceDto) {}
