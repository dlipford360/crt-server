/*
  Warnings:

  - You are about to drop the `televisionPictures` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "televisionPictures" DROP CONSTRAINT "televisionPictures_televisionId_fkey";

-- DropTable
DROP TABLE "televisionPictures";

-- CreateTable
CREATE TABLE "televisionPicture" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "televisionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "televisionPicture_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "televisionPicture" ADD CONSTRAINT "televisionPicture_televisionId_fkey" FOREIGN KEY ("televisionId") REFERENCES "Television"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
