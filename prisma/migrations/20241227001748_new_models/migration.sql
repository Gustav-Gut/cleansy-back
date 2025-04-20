/*
  Warnings:

  - Added the required column `createdAt` to the `Customers` table without a default value. This is not possible if the table is not empty.
  - Added the required column `createdAt` to the `Housemaids` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Customers" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Housemaids" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL;

-- CreateTable
CREATE TABLE "Services" (
    "id" SERIAL NOT NULL,
    "customerId" INTEGER NOT NULL,
    "housemaidId" INTEGER NOT NULL,
    "initialDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Services_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Califications" (
    "id" INTEGER NOT NULL,
    "housemaidId" INTEGER NOT NULL,
    "customerId" INTEGER NOT NULL,
    "serviceId" INTEGER NOT NULL,
    "score" INTEGER NOT NULL,
    "comments" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "createdAt" INTEGER NOT NULL,

    CONSTRAINT "Califications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Schedules" (
    "id" SERIAL NOT NULL,
    "housemaidId" INTEGER NOT NULL,
    "serviceId" INTEGER NOT NULL,
    "days" TEXT[],
    "hours" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Schedules_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Califications_id_key" ON "Califications"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Califications_serviceId_key" ON "Califications"("serviceId");

-- CreateIndex
CREATE UNIQUE INDEX "Schedules_serviceId_key" ON "Schedules"("serviceId");

-- AddForeignKey
ALTER TABLE "Services" ADD CONSTRAINT "Services_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Services" ADD CONSTRAINT "Services_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Califications" ADD CONSTRAINT "Califications_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedules" ADD CONSTRAINT "Schedules_housemaidId_fkey" FOREIGN KEY ("housemaidId") REFERENCES "Housemaids"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedules" ADD CONSTRAINT "Schedules_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "Services"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
