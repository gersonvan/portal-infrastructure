import { Controller, Get, Req } from '@nestjs/common';
import { AppService } from './app.service';
import type { Request } from 'express';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('tenant-info')
  getTenantInfo(@Req() req: Request): string {
    return `Tenant ID: ${req['tenantId']}`;
  }
}
