import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateEvaluationDto } from './dto/evaluation.dto';
import { EvaluatedEntityType } from '@prisma/client';

@Injectable()
export class EvaluationsService {
  constructor(private readonly prisma: PrismaService) {}

  async create(createEvaluationDto: CreateEvaluationDto) {
    const { evaluatedEntity, evaluatedEntityId, evaluatorId } = createEvaluationDto;

    await this.validateEntityExists(evaluatedEntity, evaluatedEntityId);

    const evaluatorExists =
      (await this.prisma.customers.findUnique({ where: { id: evaluatorId } })) ||
      (await this.prisma.housemaids.findUnique({ where: { id: evaluatorId } }));

    if (!evaluatorExists) {
      throw new NotFoundException(`Evaluator with ID "${evaluatorId}" not found.`);
    }

    return this.prisma.evaluations.create({
      data: createEvaluationDto,
    });
  }

  findAllByEntity(entityType: EvaluatedEntityType, entityEvaluatedId: string) {
    return this.prisma.evaluations.findMany({
      where: {
        evaluatedEntity: entityType,
        evaluatedEntityId: entityEvaluatedId,
      },
      orderBy: {
        createdAt: 'desc',
      },
    });
  }

  private async validateEntityExists(
    entityType: EvaluatedEntityType,
    entityEvaluatedId: string,
  ) {
    let entity = null;
    switch (entityType) {
      case 'HOUSEMAID':
        entity = await this.prisma.housemaids.findUnique({
          where: { id: entityEvaluatedId },
        });
        break;
      case 'CUSTOMER':
        entity = await this.prisma.customers.findUnique({
          where: { id: entityEvaluatedId },
        });
        break;
      case 'SERVICE':
        entity = await this.prisma.services.findUnique({
          where: { id: entityEvaluatedId },
        });
        break;
      default:
        throw new BadRequestException('Invalid evaluated entity type.');
    }

    if (!entity) {
      throw new NotFoundException(
        `${entityType} to be evaluated with ID "${entityEvaluatedId}" not found.`,
      );
    }
  }
}
