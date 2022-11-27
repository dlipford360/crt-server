/*
  Warnings:

  - You are about to drop the `CathodeRayTube` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CathodeRayTubeToUser` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `updatedAt` to the `Message` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "maskType" AS ENUM ('aperture', 'mask', 'dot');

-- CreateEnum
CREATE TYPE "televisionType" AS ENUM ('crt', 'plasma');

-- DropForeignKey
ALTER TABLE "_CathodeRayTubeToUser" DROP CONSTRAINT "_CathodeRayTubeToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_CathodeRayTubeToUser" DROP CONSTRAINT "_CathodeRayTubeToUser_B_fkey";

-- AlterTable
ALTER TABLE "Message" ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- DropTable
DROP TABLE "CathodeRayTube";

-- DropTable
DROP TABLE "_CathodeRayTubeToUser";

-- CreateTable
CREATE TABLE "Television" (
    "id" TEXT NOT NULL,
    "brand" TEXT,
    "modelNumber" TEXT,
    "family" TEXT,
    "svideo" INTEGER,
    "composite" INTEGER,
    "component" INTEGER,
    "curved" BOOLEAN,
    "widescreen" BOOLEAN,
    "diagonalInches" INTEGER,
    "coaxial" INTEGER,
    "tvl" INTEGER,
    "digitalconverter" BOOLEAN,
    "hdmi" INTEGER,
    "scart" INTEGER,
    "stereoAudio" BOOLEAN,
    "yearMade" INTEGER,
    "dvi" INTEGER,
    "vga" INTEGER,
    "ntsc" BOOLEAN,
    "maskType" "maskType",
    "type" "televisionType",
    "pal" BOOLEAN,
    "highDefinition" BOOLEAN,
    "published" BOOLEAN,
    "description" TEXT,
    "addedByUserId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Television_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "televisionPictures" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "televisionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "televisionPictures_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_MY_TELEVISIONS" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_MY_TELEVISIONS_AB_unique" ON "_MY_TELEVISIONS"("A", "B");

-- CreateIndex
CREATE INDEX "_MY_TELEVISIONS_B_index" ON "_MY_TELEVISIONS"("B");

-- AddForeignKey
ALTER TABLE "Television" ADD CONSTRAINT "Television_addedByUserId_fkey" FOREIGN KEY ("addedByUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "televisionPictures" ADD CONSTRAINT "televisionPictures_televisionId_fkey" FOREIGN KEY ("televisionId") REFERENCES "Television"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MY_TELEVISIONS" ADD CONSTRAINT "_MY_TELEVISIONS_A_fkey" FOREIGN KEY ("A") REFERENCES "Television"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MY_TELEVISIONS" ADD CONSTRAINT "_MY_TELEVISIONS_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
