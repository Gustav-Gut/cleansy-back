import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { CustomersModule } from './customers/customers.module';
import { ConfigModule } from '@nestjs/config';
import { HousemaidsModule } from './housemaids/housemaids.module';
import { ServicesModule } from './services/services.module';
import { TypesServicesModule } from './types-services/types-services.module';
import { CustomerHousesModule } from './customer-houses/customer-houses.module';
import { SchedulesModule } from './schedules/schedules.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    PrismaModule,
    CustomersModule,
    HousemaidsModule,
    ServicesModule,
    TypesServicesModule,
    CustomerHousesModule,
    SchedulesModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
