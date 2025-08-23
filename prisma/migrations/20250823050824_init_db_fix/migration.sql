/*
  Warnings:

  - You are about to drop the column `createdAt` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `durationInMinutes` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `BarbershopService` table. All the data in the column will be lost.
  - You are about to drop the column `barbershopServiceId` on the `Booking` table. All the data in the column will be lost.
  - You are about to drop the column `scheduledAt` on the `Booking` table. All the data in the column will be lost.
  - Added the required column `imageUrl` to the `BarbershopService` table without a default value. This is not possible if the table is not empty.
  - Added the required column `date` to the `Booking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `serviceId` to the `Booking` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "public"."Booking" DROP CONSTRAINT "Booking_barbershopServiceId_fkey";

-- AlterTable
ALTER TABLE "public"."BarbershopService" DROP COLUMN "createdAt",
DROP COLUMN "durationInMinutes",
DROP COLUMN "updatedAt",
ADD COLUMN     "imageUrl" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "public"."Booking" DROP COLUMN "barbershopServiceId",
DROP COLUMN "scheduledAt",
ADD COLUMN     "date" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "serviceId" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "public"."Booking" ADD CONSTRAINT "Booking_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES "public"."BarbershopService"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
