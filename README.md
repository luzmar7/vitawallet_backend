# VitaWallet API (Backend)

## 🚀 Stack

- Ruby on Rails
- PostgreSQL
- RSpec
- HTTParty

## 📦 Setup

### 1️⃣ Clone repository

git clone https://github.com/TU_USUARIO/vitawallet_backend.git
cd vitawallet_backend

### 2️⃣ Install Ruby

Recommended version:

3.2.2

pasos:
install rbenv:
Paso 1: Instalar dependencias necesarias:

sudo apt update
sudo apt install -y git curl build-essential libssl-dev libreadline-dev zlib1g-dev \
libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev \
libffi-dev

✅ Paso 2: Instalar rbenv correctamente (desde GitHub)
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

Agregar rbenv al PATH:

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init - bash)"' >> ~/.bashrc
source ~/.bashrc

Paso 3: Instalar ruby-build (plugin para instalar versiones de Ruby)
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

Paso 4: verificar
rbenv --version

Paso 5: Ahora sí instalar Ruby 3.2.2

rbenv install 3.2.2
rbenv local 3.2.2
ruby -v

### 3️⃣ Install dependencies

bundle install

### 4️⃣ Setup database

rails db:create
rails db:migrate

### 4️⃣ Setup SEEDS database
rails db:seed


### 5️⃣ Run server

rails server -p 4000
o 
rails server

Server runs on:
http://localhost:4000

## 🔐 Authentication

JWT based authentication.

Endpoints:

POST /register  
POST /login  
GET /me  

## 💰 Wallet

GET /wallet  

## 🔄 Exchange

POST /exchange  

## 📊 Transactions

GET /transactions  
GET /transactions?status=completed  

## 🧠 Architecture

- Controllers handle HTTP
- Services contain business logic (ExchangeService, PriceService)
- Models handle persistence
- JWT for auth
- External price API integration with caching

## 🧪 Testing

RSpec configured for model and service tests.