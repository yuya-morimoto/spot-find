import { Resolver, Query } from '@nestjs/graphql';
import { CheckService } from './check.service';
import { Check } from './check';

@Resolver(() => Check)
export class CheckResolver {
  constructor(private checkService: CheckService) {}

  @Query(() => Check)
  check(): Promise<Check> {
    return this.checkService.sample();
  }
}
