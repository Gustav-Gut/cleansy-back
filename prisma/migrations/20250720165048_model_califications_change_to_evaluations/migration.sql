/*
  Warnings:

  - You are about to drop the `Califications` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "EvaluationsType" AS ENUM ('customer_review', 'housemaid_review');

-- CreateEnum
CREATE TYPE "EvaluatedEntityType" AS ENUM ('housemaid', 'customer', 'service');

-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_housemaidId_fkey";

-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_serviceId_fkey";

-- DropTable
DROP TABLE "Califications";

-- DropEnum
DROP TYPE "CalificationType";

-- CreateTable
CREATE TABLE "Evaluations" (
    "id" TEXT NOT NULL,
    "evaluatedEntity" "EvaluatedEntityType" NOT NULL,
    "evaluatedEntityId" TEXT NOT NULL,
    "score" INTEGER NOT NULL,
    "comments" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "type" "EvaluationsType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Evaluations_pkey" PRIMARY KEY ("id")
);
