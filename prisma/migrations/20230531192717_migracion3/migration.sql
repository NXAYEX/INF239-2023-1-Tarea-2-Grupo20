-- CreateTable
CREATE TABLE "Personajes" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "fuerza" INTEGER NOT NULL,
    "fecha_nacimiento" DATE NOT NULL,
    "objeto" TEXT,

    CONSTRAINT "Personajes_pkey" PRIMARY KEY ("id")
);
