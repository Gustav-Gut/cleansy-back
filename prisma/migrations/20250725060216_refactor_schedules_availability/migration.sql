/*
  Warnings:

  - You are about to drop the column `days` on the `Schedules` table. All the data in the column will be lost.
  - You are about to drop the column `hours` on the `Schedules` table. All the data in the column will be lost.
  - You are about to drop the column `serviceId` on the `Schedules` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[housemaidId,dayOfWeek,startTime,endTime]` on the table `Schedules` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `dayOfWeek` to the `Schedules` table without a default value. This is not possible if the table is not empty.
  - Added the required column `endTime` to the `Schedules` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startTime` to the `Schedules` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "DayOfWeek" AS ENUM ('SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY');

-- DropForeignKey
ALTER TABLE "Schedules" DROP CONSTRAINT "Schedules_serviceId_fkey";

-- DropIndex
DROP INDEX "Schedules_serviceId_key";

-- AlterTable
ALTER TABLE "Schedules" DROP COLUMN "days",
DROP COLUMN "hours",
DROP COLUMN "serviceId",
ADD COLUMN     "dayOfWeek" "DayOfWeek" NOT NULL,
ADD COLUMN     "endTime" TEXT NOT NULL,
ADD COLUMN     "startTime" TEXT NOT NULL;

-- CreateIndex
CREATE INDEX "Schedules_housemaidId_idx" ON "Schedules"("housemaidId");

-- CreateIndex
CREATE UNIQUE INDEX "Schedules_housemaidId_dayOfWeek_startTime_endTime_key" ON "Schedules"("housemaidId", "dayOfWeek", "startTime", "endTime");
