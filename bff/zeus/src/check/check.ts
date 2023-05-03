import { Field, ID, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class Check {
  @Field(() => ID)
  id: number;

  @Field()
  message: string;
}
