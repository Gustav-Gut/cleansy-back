import { Module } from '@nestjs/common';
import { TypesServicesController } from './types-services.controller';
import { TypesServicesService } from './types-services.service';

@Module({
  controllers: [TypesServicesController],
  providers: [TypesServicesService]
})
export class TypesServicesModule {}
