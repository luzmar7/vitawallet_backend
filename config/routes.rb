Rails.application.routes.draw do
  get "transactions/index"
  get "exchanges/create"
  get "prices/quote"
  post "/register", to: "auth#register"
  post "/login", to: "auth#login"
  get '/me', to: 'auth#me'
  get "/wallet", to: "wallets#show"
  get "/prices/quote", to: "prices#quote"
  post "/exchange", to: "exchanges#create"
  get "/transactions", to: "transactions#index"
  
end