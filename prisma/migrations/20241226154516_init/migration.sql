-- CreateTable
CREATE TABLE "Customers" (
    "id" SERIAL NOT NULL,
    "email" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "lat" INTEGER NOT NULL,
    "long" INTEGER NOT NULL,
    "address" TEXT NOT NULL,

    CONSTRAINT "Customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Housemaids" (
    "id" SERIAL NOT NULL,
    "email" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "address" TEXT NOT NULL,

    CONSTRAINT "Housemaids_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Customers_email_key" ON "Customers"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Housemaids_email_key" ON "Housemaids"("email");
