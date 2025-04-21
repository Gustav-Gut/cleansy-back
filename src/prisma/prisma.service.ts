import { Injectable, OnModuleDestroy, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit, OnModuleDestroy {
  // Al arrancar el módulo, abre la conexión
  async onModuleInit() {
    await this.$connect();
  }

  // Cuando Nest apague la app, cierra la conexión
  async onModuleDestroy() {
    await this.$disconnect();
  }
}
