/*
  Warnings:

  - You are about to drop the column `typeServiceid` on the `Services` table. All the data in the column will be lost.
  - Added the required column `typeServiceId` to the `Services` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Services" DROP CONSTRAINT "Services_typeServiceid_fkey";

-- AlterTable
ALTER TABLE "Services" DROP COLUMN "typeServiceid",
ADD COLUMN     "typeServiceId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "Services" ADD CONSTRAINT "Services_typeServiceId_fkey" FOREIGN KEY ("typeServiceId") REFERENCES "TypesServices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
