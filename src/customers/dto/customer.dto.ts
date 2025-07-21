import { PartialType } from '@nestjs/mapped-types';
import { IsEmail, IsString, IsNotEmpty } from 'class-validator';

export class CreateCustomerDto {
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
}

export class UpdateCustomerDto extends PartialType(CreateCustomerDto) {}
