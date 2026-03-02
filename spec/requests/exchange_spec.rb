require 'rails_helper'

RSpec.describe "Exchange", type: :request do

  describe "POST /exchange" do
    it "rechaza la transacción si no hay saldo suficiente" do
      user = User.create!(
        email: "exchange@test.com",
        password: "123456",
        password_confirmation: "123456"
      )

      token = JsonWebToken.encode(user_id: user.id)

      post "/exchange",
        params: {
          from_currency: "USD",
          to_currency: "BTC",
          amount: 1000
        },
        headers: {
          "Authorization" => "Bearer #{token}"
        }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

end