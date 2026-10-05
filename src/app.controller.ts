import { Controller, Get } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

@Controller()
export class AppController {
  constructor(private readonly config: ConfigService) { }

  @Get('health/live')
  live() {
    return {
      status: 'ok',
    };
  }

  @Get('health/ready')
  ready() {
    return {
      status: 'ready',
    };
  }

  @Get('hello')
  hello() {
    return {
      success: true,
      service: 'backend-two',
      environment: this.config.get<string>('ENVIRONMENT') || 'unknown',
      message:
        this.config.get<string>('SERVICE_MESSAGE') ||
        'Hello from backend-two',
      route: '/api/service-two/hello',
    };
  }
}
