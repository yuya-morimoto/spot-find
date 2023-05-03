import { Injectable } from '@nestjs/common';
import { Check } from './check';

const checkSample = {
  id: 1,
  message: 'check message',
};

@Injectable()
export class CheckService {
  sample(): Promise<Check> {
    return Promise.resolve(checkSample);
  }
}
