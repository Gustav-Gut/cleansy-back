/*
  Warnings:

  - You are about to drop the column `address` on the `Customers` table. All the data in the column will be lost.
  - You are about to drop the column `lat` on the `Customers` table. All the data in the column will be lost.
  - You are about to drop the column `long` on the `Customers` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[housemaidId]` on the table `Califications` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[customerId]` on the table `Califications` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `typeServiceid` to the `Services` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_customerId_fkey";

-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_housemaidId_fkey";

-- DropForeignKey
ALTER TABLE "Califications" DROP CONSTRAINT "Califications_serviceId_fkey";

-- DropIndex
DROP INDEX "Califications_id_key";

-- AlterTable
CREATE SEQUENCE califications_id_seq;
ALTER TABLE "Califications" ALTER COLUMN "id" SET DEFAULT nextval('califications_id_seq'),
ALTER COLUMN "housemaidId" DROP NOT NULL,
ALTER COLUMN "customerId" DROP NOT NULL,
ALTER COLUMN "serviceId" DROP NOT NULL;
ALTER SEQUENCE califications_id_seq OWNED BY "Califications"."id";

-- AlterTable
ALTER TABLE "Customers" DROP COLUMN "address",
DROP COLUMN "lat",
DROP COLUMN "long";

-- AlterTable
ALTER TABLE "Services" ADD COLUMN     "typeServiceid" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "CustomerHouses" (
    "id" SERIAL NOT NULL,
    "customerId" INTEGER NOT NULL,
    "lat" INTEGER NOT NULL,
    "long" INTEGER NOT NULL,
    "address" TEXT NOT NULL,
    "distribution" TEXT NOT NULL,
    "messure" INTEGER[],
    "type" TEXT NOT NULL,

    CONSTRAINT "CustomerHouses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TypesServices" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TypesServices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Documents" (
    "id" SERIAL NOT NULL,
    "housemaidId" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "supportId" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "createdAt" TEXT NOT NULL,

    CONSTRAINT "Documents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Supports" (
    "id" SERIAL NOT NULL,
    "housemaidId" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "tittle" TEXT NOT NULL,
    "comments" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TEXT NOT NULL,

    CONSTRAINT "Supports_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_HousemaidsToTypesServices" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_HousemaidsToTypesServices_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE UNIQUE INDEX "Documents_housemaidId_key" ON "Documents"("housemaidId");

-- CreateIndex
CREATE UNIQUE INDEX "Documents_customerId_key" ON "Documents"("customerId");

-- CreateIndex
CREATE UNIQUE INDEX "Documents_supportId_key" ON "Documents"("supportId");

-- CreateIndex
CREATE INDEX "_HousemaidsToTypesServices_B_index" ON "_HousemaidsToTypesServices"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Califications_housemaidId_key" ON "Califications"("housemaidId");

-- CreateIndex
CREATE UNIQUE INDEX "Califications_customerId_key" ON "Califications"("customerId");

-- AddForeignKey
ALTER TABLE "CustomerHouses" ADD CONSTRAINT "CustomerHouses_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Services" ADD CONSTRAINT "Services_typeServiceid_fkey" FOREIGN KEY ("typeServiceid") REFERENCES "TypesServices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Services"("id") ON DELETE SET NULL ON UPDATE CASCADE;

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
