/*
  Warnings:

  - Made the column `userId` on table `Message` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Message" DROP CONSTRAINT "Message_userId_fkey";

-- AlterTable
ALTER TABLE "Message" ALTER COLUMN "userId" SET NOT NULL;

-- CreateTable
CREATE TABLE "CathodeRayTube" (
    "id" TEXT NOT NULL,
    "brand" TEXT,
    "modelNumber" TEXT,
    "svideo" INTEGER,
    "composite" INTEGER,
    "component" INTEGER,
    "curved" BOOLEAN,
    "widescreen" BOOLEAN,
    "coaxial" INTEGER,
    "ntsc" BOOLEAN,
    "pal" BOOLEAN,
    "highDefinition" BOOLEAN,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CathodeRayTube_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CathodeRayTubeToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CathodeRayTubeToUser_AB_unique" ON "_CathodeRayTubeToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_CathodeRayTubeToUser_B_index" ON "_CathodeRayTubeToUser"("B");

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CathodeRayTubeToUser" ADD CONSTRAINT "_CathodeRayTubeToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "CathodeRayTube"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CathodeRayTubeToUser" ADD CONSTRAINT "_CathodeRayTubeToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
