# Crear usuario de prueba
user = User.find_or_create_by!(email: "demo@wallet.com") do |u|
    u.password = "demo123"
    u.password_confirmation = "demo123"
  end
  
  # Crear wallet para el usuario
  wallet = Wallet.find_or_create_by!(user: user)
  
  # Montos iniciales por moneda
  balances = {
    "USD" => 1500,
    "CLP" => 750000,
    "BTC" => 0.35,
    "USDC" => 500,
    "USDT" => 650
  }
  
  balances.each do |currency, amount|
    balance = Balance.find_or_initialize_by(
      wallet: wallet,
      currency: currency
    )
  
    balance.amount = amount
    balance.save!
  end
  
  puts "Seed ejecutado correctamente"
  puts "Usuario de prueba:"
  puts "email: demo@wallet.com"
  puts "password: demo123"
  puts "Monedas creadas: #{balances.keys.join(', ')}"