/*
  Warnings:

  - The primary key for the `Califications` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `CustomerHouses` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Customers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Documents` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Housemaids` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Schedules` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Services` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Supports` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `TypesServices` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `_HousemaidsToTypesServices` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_housemaidId_fkey";

-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_serviceId_fkey";

-- DropForeignKey
ALTER TABLE "CustomerHouses" DROP CONSTRAINT "CustomerHouses_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Documents" DROP CONSTRAINT "Documents_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Documents" DROP CONSTRAINT "Documents_housemaidId_fkey";

-- DropForeignKey
ALTER TABLE "Documents" DROP CONSTRAINT "Documents_supportId_fkey";

-- DropForeignKey
ALTER TABLE "Schedules" DROP CONSTRAINT "Schedules_housemaidId_fkey";

-- DropForeignKey
ALTER TABLE "Schedules" DROP CONSTRAINT "Schedules_serviceId_fkey";

-- DropForeignKey
ALTER TABLE "Services" DROP CONSTRAINT "Services_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Services" DROP CONSTRAINT "Services_housemaidId_fkey";

-- DropForeignKey
ALTER TABLE "Services" DROP CONSTRAINT "Services_typeServiceid_fkey";

-- DropForeignKey
ALTER TABLE "Supports" DROP CONSTRAINT "Supports_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Supports" DROP CONSTRAINT "Supports_housemaidId_fkey";

-- DropForeignKey
ALTER TABLE "_HousemaidsToTypesServices" DROP CONSTRAINT "_HousemaidsToTypesServices_A_fkey";

-- DropForeignKey
ALTER TABLE "_HousemaidsToTypesServices" DROP CONSTRAINT "_HousemaidsToTypesServices_B_fkey";

-- AlterTable
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "housemaidId" SET DATA TYPE TEXT,
ALTER COLUMN "customerId" SET DATA TYPE TEXT,
ALTER COLUMN "serviceId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Califications_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "califications_id_seq";

-- AlterTable
ALTER TABLE "CustomerHouses" DROP CONSTRAINT "CustomerHouses_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "customerId" SET DATA TYPE TEXT,
ADD CONSTRAINT "CustomerHouses_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "CustomerHouses_id_seq";

-- AlterTable
ALTER TABLE "Customers" DROP CONSTRAINT "Customers_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "email" SET DATA TYPE TEXT,
ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Customers_id_seq";

-- AlterTable
ALTER TABLE "Documents" DROP CONSTRAINT "Documents_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "housemaidId" SET DATA TYPE TEXT,
ALTER COLUMN "customerId" SET DATA TYPE TEXT,
ALTER COLUMN "supportId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Documents_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Documents_id_seq";

-- AlterTable
ALTER TABLE "Housemaids" DROP CONSTRAINT "Housemaids_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Housemaids_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Housemaids_id_seq";

-- AlterTable
ALTER TABLE "Schedules" DROP CONSTRAINT "Schedules_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "housemaidId" SET DATA TYPE TEXT,
ALTER COLUMN "serviceId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Schedules_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Schedules_id_seq";

-- AlterTable
ALTER TABLE "Services" DROP CONSTRAINT "Services_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "customerId" SET DATA TYPE TEXT,
ALTER COLUMN "housemaidId" SET DATA TYPE TEXT,
ALTER COLUMN "typeServiceid" SET DATA TYPE TEXT,
ADD CONSTRAINT "Services_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Services_id_seq";

-- AlterTable
ALTER TABLE "Supports" DROP CONSTRAINT "Supports_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "housemaidId" SET DATA TYPE TEXT,
ALTER COLUMN "customerId" SET DATA TYPE TEXT,
ADD CONSTRAINT "Supports_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Supports_id_seq";

-- AlterTable
ALTER TABLE "TypesServices" DROP CONSTRAINT "TypesServices_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "TypesServices_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "TypesServices_id_seq";

-- AlterTable
ALTER TABLE "_HousemaidsToTypesServices" DROP CONSTRAINT "_HousemaidsToTypesServices_AB_pkey",
ALTER COLUMN "A" SET DATA TYPE TEXT,
ALTER COLUMN "B" SET DATA TYPE TEXT,
ADD CONSTRAINT "_HousemaidsToTypesServices_AB_pkey" PRIMARY KEY ("A", "B");

-- AddForeignKey
ALTER TABLE "CustomerHouses" ADD CONSTRAINT "CustomerHouses_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Services" ADD CONSTRAINT "Services_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Services" ADD CONSTRAINT "Services_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Services" ADD CONSTRAINT "Services_typeServiceid_fkey" FOREIGN KEY ("typeServiceid") REFERENCES "TypesServices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Services"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedules" ADD CONSTRAINT "Schedules_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedules" ADD CONSTRAINT "Schedules_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Documents" ADD CONSTRAINT "Documents_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Documents" ADD CONSTRAINT "Documents_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Documents" ADD CONSTRAINT "Documents_supportId_fkey" FOREIGN KEY ("supportId") REFERENCES "Supports"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supports" ADD CONSTRAINT "Supports_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supports" ADD CONSTRAINT "Supports_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HousemaidsToTypesServices" ADD CONSTRAINT "_HousemaidsToTypesServices_A_fkey" FOREIGN KEY ("A") REFERENCES "Housemaids"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_HousemaidsToTypesServices" ADD CONSTRAINT "_HousemaidsToTypesServices_B_fkey" FOREIGN KEY ("B") REFERENCES "TypesServices"("id") ON DELETE CASCADE ON UPDATE CASCADE;
