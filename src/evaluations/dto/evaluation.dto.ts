import { EvaluatedEntityType, EvaluationsType } from '@prisma/client';
import { IsEnum, IsInt, IsNotEmpty, IsString, Max, Min, Matches } from 'class-validator';

// Regex para validar CUID
const CUID_REGEX = /^c[^\s-]{8,}$/i;

export class CreateEvaluationDto {
  @IsEnum(EvaluatedEntityType)
  @IsNotEmpty()
  evaluatedEntity: EvaluatedEntityType;

  @IsString()
  @IsNotEmpty()
  @Matches(CUID_REGEX, { message: 'evaluatedEntityId must be a valid type' })
  evaluatedEntityId: string;

  @IsString()
  @IsNotEmpty()
  @Matches(CUID_REGEX, { message: 'evaluatorId must be a valid type' })
  evaluatorId: string;

  @IsInt()
  @Min(1)
  @Max(5)
  @IsNotEmpty()
  score: number;

  @IsString()
  @IsNotEmpty()
  comments: string;

  @IsString()
  @IsNotEmpty()
  title: string;

  @IsEnum(EvaluationsType)
  @IsNotEmpty()
  type: EvaluationsType;
}

export class FindEvaluationsQueryDto {
  @IsEnum(EvaluatedEntityType)
  @IsNotEmpty()
  entityType: EvaluatedEntityType;

  @IsString()
  @IsNotEmpty()
  @Matches(CUID_REGEX, { message: 'entityId must be a valid type' })
  entityEvaluatedId: string;
}
