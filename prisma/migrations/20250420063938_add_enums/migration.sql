/*
  Warnings:

  - The `status` column on the `Services` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `status` column on the `Supports` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `type` on the `Califications` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `type` on the `CustomerHouses` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `type` on the `Documents` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "CustomerStatus" AS ENUM ('active', 'suspended');

-- CreateEnum
CREATE TYPE "CustomerHouseType" AS ENUM ('flat', 'house', 'office');

-- CreateEnum
CREATE TYPE "HousemaidStatus" AS ENUM ('active', 'suspended', 'fired', 'medical_leave', 'vacation', 'training');

-- CreateEnum
CREATE TYPE "ServiceStatus" AS ENUM ('scheduled', 'in_progress', 'suspended', 'finished', 'canceled');

-- CreateEnum
CREATE TYPE "CalificationType" AS ENUM ('customer_review', 'housemaid_review');

-- CreateEnum
CREATE TYPE "DocumentType" AS ENUM ('contract', 'id_card', 'resume', 'background_check', 'support_document');

-- CreateEnum
CREATE TYPE "SupportStatus" AS ENUM ('new', 'in_progress', 'closed');

-- AlterTable
ALTER TABLE "Califications" DROP COLUMN "type",
ADD COLUMN     "type" "CalificationType" NOT NULL;

-- AlterTable
ALTER TABLE "CustomerHouses" DROP COLUMN "type",
ADD COLUMN     "type" "CustomerHouseType" NOT NULL;

-- AlterTable
ALTER TABLE "Customers" ADD COLUMN     "status" "CustomerStatus" NOT NULL DEFAULT 'active';

-- AlterTable
ALTER TABLE "Documents" DROP COLUMN "type",
ADD COLUMN     "type" "DocumentType" NOT NULL;

-- AlterTable
ALTER TABLE "Housemaids" ADD COLUMN     "status" "HousemaidStatus" NOT NULL DEFAULT 'training',
ALTER COLUMN "email" SET DATA TYPE TEXT;

-- AlterTable
ALTER TABLE "Services" DROP COLUMN "status",
ADD COLUMN     "status" "ServiceStatus" NOT NULL DEFAULT 'scheduled';

-- AlterTable
ALTER TABLE "Supports" DROP COLUMN "status",
ADD COLUMN     "status" "SupportStatus" NOT NULL DEFAULT 'new';
