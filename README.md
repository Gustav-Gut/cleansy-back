# Backend de Cleansy

Este es el backend para la plataforma Cleansy, una aplicación para gestionar y agendar servicios de limpieza. Está construido con [NestJS](https://nestjs.com/) y utiliza [Prisma](https://www.prisma.io/) como ORM para la interacción con la base de datos PostgreSQL.

## Descripción

La aplicación gestiona clientes, empleadas del hogar, un catálogo de servicios y todo el flujo de agendamiento, incluyendo la disponibilidad de las empleadas y la prevención de conflictos de horario.

---

## Requisitos Previos

Asegúrate de tener instalado lo siguiente en tu entorno de desarrollo:

- [Node.js](https://nodejs.org/) (v22.17.0 o superior OBLIGATORIO) (Recomiendo usar NVM para instalar node)
- [npm](https://www.npmjs.com/)
- [PostgreSQL](https://www.postgresql.org/)
- [Git](https://git-scm.com/)

---

## Instalación y Puesta en Marcha

Sigue estos pasos para levantar el proyecto en tu máquina local.

### 1. Clonar el Repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
cd cleansy-back
```

### 2. Instalar Dependencias

```bash
npm install
```

### 3. Configurar las Variables de Entorno

Crea una copia del archivo de ejemplo `.env.example` y renómbrala a `.env`.

```bash
cp .env.example .env
```

Abre el archivo `.env` y configura tu `DATABASE_URL` con las credenciales de tu base de datos PostgreSQL local.

**Ejemplo:**

```env
DATABASE_URL="postgresql://postgres:mysecretpassword@localhost:5432/cleansy?schema=public"
```

### 4. Configurar la Base de Datos

Esta puede ser levantada co un docker compose en local y usarla para probar nuestro backend.
Una vez que tu base de datos PostgreSQL está corriendo y la `DATABASE_URL` está configurada, ejecuta las migraciones de Prisma. Este comando creará todas las tablas y tipos necesarios en tu base de datos.

```bash
npx prisma migrate dev
```

---

## Ejecutar la Aplicación

- **Modo de Desarrollo (con auto-recarga):**

  ```bash
  npm run start:dev
  ```

- **Modo de Producción:**
  ```bash
  npm run build
  npm run start:prod
  ```

La aplicación estará disponible en `http://localhost:3000` (o el puerto que hayas configurado en tu archivo `.env`).

---

## Ejecutar Pruebas

- **Pruebas Unitarias:**

  ```bash
  npm run test
  ```

- **Pruebas End-to-End (E2E):**

  ```bash
  npm run test:e2e
  ```

- **Cobertura de Pruebas:**
  ```bash
  npm run test:cov
  ```
