import { Module } from '@nestjs/common';
import { HousemaidsController } from './housemaids.controller';
import { HousemaidsService } from './housemaids.service';

@Module({
  controllers: [HousemaidsController],
  providers: [HousemaidsService]
})
export class HousemaidsModule {}
