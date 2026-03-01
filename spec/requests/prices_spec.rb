require 'rails_helper'

RSpec.describe "Prices", type: :request do
  describe "GET /quote" do
    it "returns http success" do
      get "/prices/quote"
      expect(response).to have_http_status(:success)
    end
  end

end
