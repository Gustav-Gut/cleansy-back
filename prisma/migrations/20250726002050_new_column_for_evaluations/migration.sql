/*
  Warnings:

  - Added the required column `evaluatorId` to the `Evaluations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Evaluations" ADD COLUMN     "evaluatorId" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "Evaluations_evaluatedEntity_evaluatedEntityId_idx" ON "Evaluations"("evaluatedEntity", "evaluatedEntityId");

-- CreateIndex
CREATE INDEX "Evaluations_evaluatorId_idx" ON "Evaluations"("evaluatorId");
