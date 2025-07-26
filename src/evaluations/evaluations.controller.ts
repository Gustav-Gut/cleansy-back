import { Controller, Get, Post, Body, Query } from '@nestjs/common';
import { EvaluationsService } from './evaluations.service';
import { CreateEvaluationDto, FindEvaluationsQueryDto } from './dto/evaluation.dto';

@Controller('evaluations')
export class EvaluationsController {
  constructor(private readonly evaluationsService: EvaluationsService) {}

  @Post()
  create(@Body() createEvaluationDto: CreateEvaluationDto) {
    return this.evaluationsService.create(createEvaluationDto);
  }

  // Endpoint para obtener evaluaciones de una entidad:
  // E.g., GET /evaluations?entityType=HOUSEMAID&entityId=...
  @Get()
  findAllByEntity(@Query() query: FindEvaluationsQueryDto) {
    return this.evaluationsService.findAllByEntity(
      query.entityType,
      query.entityEvaluatedId,
    );
  }
}
