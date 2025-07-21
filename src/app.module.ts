import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { CustomersModule } from './customers/customers.module';
import { ConfigModule } from '@nestjs/config';
import { HousemaidsModule } from './housemaids/housemaids.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    PrismaModule,
    CustomersModule,
    HousemaidsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
