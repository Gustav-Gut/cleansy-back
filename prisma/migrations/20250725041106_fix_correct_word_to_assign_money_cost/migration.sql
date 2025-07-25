/*
  Warnings:

  - You are about to drop the column `value` on the `TypesServices` table. All the data in the column will be lost.
  - Added the required column `price` to the `TypesServices` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "TypesServices" DROP COLUMN "value",
ADD COLUMN     "price" INTEGER NOT NULL;
