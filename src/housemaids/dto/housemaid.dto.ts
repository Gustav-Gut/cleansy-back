import { PartialType } from '@nestjs/mapped-types';
import { IsEmail, IsNotEmpty, IsString, IsOptional, IsEnum } from 'class-validator';
import { HousemaidStatus } from '@prisma/client';

export class CreateHousemaidDto {
  @IsEmail()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  name: string;

  @IsString()
  @IsNotEmpty()
  lastname: string;

  @IsString()
  @IsNotEmpty()
  phone: string;

  @IsString()
  @IsNotEmpty()
  address: string;

  @IsOptional()
  @IsEnum(HousemaidStatus)
  status?: HousemaidStatus;
}

export class UpdateHousemaidDto extends PartialType(CreateHousemaidDto) {}
