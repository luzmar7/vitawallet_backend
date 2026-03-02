# 📘 VitaWallet API – Backend

Backend desarrollado como parte de la prueba técnica Fullstack VitaWallet.

---

## 🚀 Stack

- Ruby on Rails
- PostgreSQL
- JWT Authentication
- RSpec
- HTTParty
- Docker

---

## 🐳 Quick Start (Recomendado – Docker)

Clonar repositorio:

```bash
git clone https://github.com/luzmar7/vitawallet_backend.git
cd vitawallet_backend
```

Levantar servicios:

```bash
docker compose build
docker compose up
```

Servidor disponible en:

http://localhost:4000

Ejecutar tests dentro de Docker:

```bash
docker compose run web bundle exec rspec
```

---

## 💻 Setup Manual (Alternativo)

### 1️⃣ Ruby

Versión recomendada:

3.2.2

### 2️⃣ Instalar dependencias

```bash
bundle install
```

### 3️⃣ Base de datos

```bash
rails db:create
rails db:migrate
rails db:seed
```

### 4️⃣ Ejecutar servidor

```bash
rails server -p 4000
```

---

## 🔐 Autenticación

Autenticación basada en JWT.

### Endpoints

- POST /register  
- POST /login  
- GET /me  

Los endpoints protegidos requieren:

Authorization: Bearer <token>

---

## 💰 Wallet

GET /wallet  

Devuelve balances en:

- USD
- CLP
- BTC
- USDC
- USDT

---

## 🔄 Exchange

POST /exchange  

Validaciones implementadas:

- Validación de saldo suficiente
- Manejo de precisión decimal
- Estados de transacción:
  - pending
  - completed
  - rejected
- Uso de transacción de base de datos para mantener consistencia

---

## 📊 Transactions

- GET /transactions  
- GET /transactions?status=completed  

Soporta filtrado por estado.

---

## 🧠 Decisiones Técnicas

- Se utilizó JWT para mantener autenticación stateless.
- Se implementaron Service Objects (ExchangeService, PriceService) para separar lógica de negocio del controlador.
- El proceso de exchange se ejecuta dentro de una transacción de base de datos para evitar inconsistencias.
- Se integró API externa de precios con manejo básico de errores.
- Se agregó RSpec para pruebas de autenticación y lógica crítica.
- Se dockerizó el proyecto para facilitar ejecución y evaluación.

---

## 🧪 Testing

Ejecutar:

```bash
bundle exec rspec
```

Cobertura actual:

- Login
- Protección de endpoints
- Validación de exchange
- Validaciones de modelo

---

## 🔜 Mejoras Futuras

- Documentación Swagger/OpenAPI
- CI/CD con GitHub Actions
- Cache con Redis
- Paginación avanzada
