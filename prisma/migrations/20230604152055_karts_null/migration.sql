/*
  Warnings:

  - You are about to drop the column `id_persona` on the `Karts` table. All the data in the column will be lost.
  - Added the required column `id_personaje` to the `Karts` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Karts" DROP CONSTRAINT "Karts_id_persona_fkey";

-- AlterTable
ALTER TABLE "Karts" DROP COLUMN "id_persona",
ADD COLUMN     "id_personaje" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Karts" ADD CONSTRAINT "Karts_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "Personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
