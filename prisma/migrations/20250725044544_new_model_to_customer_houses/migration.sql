/*
  Warnings:

  - You are about to drop the column `lat` on the `CustomerHouses` table. All the data in the column will be lost.
  - You are about to drop the column `long` on the `CustomerHouses` table. All the data in the column will be lost.
  - You are about to drop the column `messure` on the `CustomerHouses` table. All the data in the column will be lost.
  - Added the required column `latitude` to the `CustomerHouses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `longitude` to the `CustomerHouses` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `distribution` on the `CustomerHouses` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "CustomerHouses" DROP COLUMN "lat",
DROP COLUMN "long",
DROP COLUMN "messure",
ADD COLUMN     "latitude" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "longitude" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "sizeSqm" INTEGER,
DROP COLUMN "distribution",
ADD COLUMN     "distribution" JSONB NOT NULL;
