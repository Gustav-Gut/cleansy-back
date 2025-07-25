import { PartialType } from '@nestjs/mapped-types';
import { CustomerHouseType } from '@prisma/client';
import { Type } from 'class-transformer';
import {
  IsEnum,
  IsInt,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsPositive,
  IsString,
  ValidateNested,
} from 'class-validator';

export class HouseDistributionDto {
  @IsInt()
  @IsPositive()
  @IsNotEmpty()
  bedrooms: number;

  @IsInt()
  @IsPositive()
  @IsNotEmpty()
  bathrooms: number;

  @IsString()
  @IsOptional()
  notes?: string;
}

export class CreateCustomerHouseDto {
  @IsNumber()
  @IsNotEmpty()
  latitude: number;

  @IsNumber()
  @IsNotEmpty()
  longitude: number;

  @IsString()
  @IsNotEmpty()
  address: string;

  @IsNotEmpty()
  @ValidateNested()
  @Type(() => HouseDistributionDto)
  distribution: HouseDistributionDto;

  @IsOptional()
  @IsInt()
  @IsPositive()
  sizeSqm?: number;

  @IsEnum(CustomerHouseType)
  @IsNotEmpty()
  type: CustomerHouseType;
}

export class UpdateCustomerHouseDto extends PartialType(CreateCustomerHouseDto) {}
