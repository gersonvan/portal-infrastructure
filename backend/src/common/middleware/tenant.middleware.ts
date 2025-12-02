import { Injectable, NestMiddleware, BadRequestException } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';

@Injectable()
export class TenantMiddleware implements NestMiddleware {
  private readonly validTenants = ['avp', 'unigrande'];

  use(req: Request, res: Response, next: NextFunction) {
    const tenantId = req.headers['x-tenant-id'];

    if (!tenantId) {
      throw new BadRequestException('x-tenant-id header is missing');
    }

    if (Array.isArray(tenantId)) {
        throw new BadRequestException('x-tenant-id header must be a single value');
    }

    if (!this.validTenants.includes(tenantId)) {
      throw new BadRequestException(`Invalid tenant ID. Must be one of: ${this.validTenants.join(', ')}`);
    }

    req['tenantId'] = tenantId;
    next();
  }
}
