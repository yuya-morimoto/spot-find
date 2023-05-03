import { Module } from '@nestjs/common';
import { CheckResolver } from './check.resolver';
import { CheckService } from './check.service';

@Module({
  providers: [CheckResolver, CheckService],
})
export class CheckModule {}
