/*
  Warnings:

  - Made the column `brand` on table `CathodeRayTube` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "CathodeRayTube" ALTER COLUMN "brand" SET NOT NULL;
