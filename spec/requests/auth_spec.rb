require 'rails_helper'

RSpec.describe "Auth", type: :request do

  describe "POST /login" do
    it "retorna token si credenciales correctas" do
      user = User.create!(
        email: "test@mail.com",
        password: "123456",
        password_confirmation: "123456"
      )

      post "/login", params: {
        email: "test@mail.com",
        password: "123456"
      }

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json["token"]).not_to be_nil
    end
  end

  describe "GET /wallet" do
    it "retorna 401 si no se envía token" do
      get "/wallet"

      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "GET /wallet con token válido" do
    it "retorna 200 si el token es válido" do
      user = User.create!(
        email: "wallet@test.com",
        password: "123456",
        password_confirmation: "123456"
      )
  
      token = JsonWebToken.encode(user_id: user.id)
  
      get "/wallet", headers: {
        "Authorization" => "Bearer #{token}"
      }
  
      expect(response).to have_http_status(:ok)
    end
  end

end