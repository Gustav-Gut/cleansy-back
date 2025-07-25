/*
  Warnings:

  - You are about to drop the column `customerId` on the `Documents` table. All the data in the column will be lost.
  - You are about to drop the column `housemaidId` on the `Documents` table. All the data in the column will be lost.
  - You are about to drop the column `supportId` on the `Documents` table. All the data in the column will be lost.
  - Added the required column `documentOwnerId` to the `Documents` table without a default value. This is not possible if the table is not empty.
  - Added the required column `documentOwnerType` to the `Documents` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "DocumentOwnerType" AS ENUM ('CUSTOMER', 'HOUSEMAID', 'SUPPORT_TICKET');

-- DropForeignKey
ALTER TABLE "Documents" DROP CONSTRAINT "Documents_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Documents" DROP CONSTRAINT "Documents_housemaidId_fkey";

-- DropForeignKey
ALTER TABLE "Documents" DROP CONSTRAINT "Documents_supportId_fkey";

-- DropIndex
DROP INDEX "Documents_customerId_key";

-- DropIndex
DROP INDEX "Documents_housemaidId_key";

-- DropIndex
DROP INDEX "Documents_supportId_key";

-- AlterTable
ALTER TABLE "Documents" DROP COLUMN "customerId",
DROP COLUMN "housemaidId",
DROP COLUMN "supportId",
ADD COLUMN     "documentOwnerId" TEXT NOT NULL,
ADD COLUMN     "documentOwnerType" "DocumentOwnerType" NOT NULL;
