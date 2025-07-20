import { PartialType } from '@nestjs/mapped-types';

export class CreateCustomerDto {
  email: string;
  name: string;
  lastname: string;
  phone: string;
}

export class UpdateCustomerDto extends PartialType(CreateCustomerDto) {}
