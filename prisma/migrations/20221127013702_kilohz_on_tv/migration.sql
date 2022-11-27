/*
  Warnings:

  - Made the column `type` on table `Television` required. This step will fail if there are existing NULL values in that column.

*/
-- CreateEnum
CREATE TYPE "kilohertz" AS ENUM ('fifteen', 'twentyfive', 'thirtyone');

-- AlterTable
ALTER TABLE "Television" ADD COLUMN     "kilohertz" "kilohertz",
ALTER COLUMN "type" SET NOT NULL,
ALTER COLUMN "type" SET DEFAULT 'crt';
