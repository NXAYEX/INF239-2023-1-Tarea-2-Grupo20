/*
  Warnings:

  - You are about to alter the column `nombre` on the `Personajes` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(45)`.
  - You are about to alter the column `objeto` on the `Personajes` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(30)`.

*/
-- AlterTable
ALTER TABLE "Personajes" ALTER COLUMN "nombre" SET DATA TYPE VARCHAR(45),
ALTER COLUMN "objeto" SET DATA TYPE VARCHAR(30);

-- CreateTable
CREATE TABLE "Karts" (
    "id" SERIAL NOT NULL,
    "modelo" VARCHAR(45) NOT NULL,
    "color" VARCHAR(45) NOT NULL,
    "velocidad_max" INTEGER,
    "id_persona" INTEGER NOT NULL,

    CONSTRAINT "Karts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trabajos" (
    "id" SERIAL NOT NULL,
    "descripcion" VARCHAR(45),
    "sueldo" INTEGER NOT NULL,

    CONSTRAINT "Trabajos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Personaje_tiene_trabajo" (
    "id_trabajo" INTEGER NOT NULL,
    "id_personaje" INTEGER NOT NULL,
    "fecha_inicio" DATE NOT NULL,
    "fecha_termino" DATE,

    CONSTRAINT "Personaje_tiene_trabajo_pkey" PRIMARY KEY ("id_trabajo","id_personaje")
);

-- CreateTable
CREATE TABLE "Defensas" (
    "id" SERIAL NOT NULL,
    "Defenzas" VARCHAR(45) NOT NULL,

    CONSTRAINT "Defensas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reinos" (
    "id" SERIAL NOT NULL,
    "nombre" VARCHAR(45) NOT NULL,
    "ubicacion" VARCHAR(45) NOT NULL,
    "superficie" INTEGER NOT NULL,

    CONSTRAINT "Reinos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DefensasReinos" (
    "id_defensas" INTEGER NOT NULL,
    "id_reino" INTEGER NOT NULL,

    CONSTRAINT "DefensasReinos_pkey" PRIMARY KEY ("id_defensas","id_reino")
);

-- CreateTable
CREATE TABLE "Diplomacias" (
    "id_reino1" INTEGER NOT NULL,
    "id_reino2" INTEGER NOT NULL,
    "es_aliado" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Diplomacias_pkey" PRIMARY KEY ("id_reino1","id_reino2")
);

-- CreateTable
CREATE TABLE "Personaje_habita_reino" (
    "id_personaje" INTEGER NOT NULL,
    "id_reino" INTEGER NOT NULL,
    "fecha_registro" DATE NOT NULL,
    "es_gobernante" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Personaje_habita_reino_pkey" PRIMARY KEY ("id_personaje","id_reino")
);

-- AddForeignKey
ALTER TABLE "Karts" ADD CONSTRAINT "Karts_id_persona_fkey" FOREIGN KEY ("id_persona") REFERENCES "Personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personaje_tiene_trabajo" ADD CONSTRAINT "Personaje_tiene_trabajo_id_trabajo_fkey" FOREIGN KEY ("id_trabajo") REFERENCES "Trabajos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personaje_tiene_trabajo" ADD CONSTRAINT "Personaje_tiene_trabajo_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "Personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DefensasReinos" ADD CONSTRAINT "DefensasReinos_id_defensas_fkey" FOREIGN KEY ("id_defensas") REFERENCES "Defensas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DefensasReinos" ADD CONSTRAINT "DefensasReinos_id_reino_fkey" FOREIGN KEY ("id_reino") REFERENCES "Reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Diplomacias" ADD CONSTRAINT "Diplomacias_id_reino1_fkey" FOREIGN KEY ("id_reino1") REFERENCES "Reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personaje_habita_reino" ADD CONSTRAINT "Personaje_habita_reino_id_personaje_fkey" FOREIGN KEY ("id_personaje") REFERENCES "Personajes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Personaje_habita_reino" ADD CONSTRAINT "Personaje_habita_reino_id_reino_fkey" FOREIGN KEY ("id_reino") REFERENCES "Reinos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
