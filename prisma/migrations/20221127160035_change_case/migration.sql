/*
  Warnings:

  - You are about to drop the `televisionPicture` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "televisionPicture" DROP CONSTRAINT "televisionPicture_televisionId_fkey";

-- DropTable
DROP TABLE "televisionPicture";

-- CreateTable
CREATE TABLE "TelevisionPicture" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "televisionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TelevisionPicture_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TelevisionPicture" ADD CONSTRAINT "TelevisionPicture_televisionId_fkey" FOREIGN KEY ("televisionId") REFERENCES "Television"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
