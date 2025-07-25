import { PartialType } from '@nestjs/mapped-types';
import { IsInt, IsNotEmpty, IsPositive, IsString } from 'class-validator';

export class CreateTypesServiceDto {
  @IsString()
  @IsNotEmpty()
  title: string;

  @IsString()
  @IsNotEmpty()
  description: string;

  @IsInt()
  @IsPositive()
  @IsNotEmpty()
  price: number;
}

export class UpdateTypesServiceDto extends PartialType(CreateTypesServiceDto) {}
