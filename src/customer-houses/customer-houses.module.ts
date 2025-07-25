import { Module } from '@nestjs/common';
import { CustomerHousesController } from './customer-houses.controller';
import { CustomerHousesService } from './customer-houses.service';

@Module({
  controllers: [CustomerHousesController],
  providers: [CustomerHousesService]
})
export class CustomerHousesModule {}
