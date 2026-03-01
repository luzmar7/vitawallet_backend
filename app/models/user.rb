class User < ApplicationRecord
    has_secure_password
  
    validates :email, presence: true, uniqueness: true
    has_one :wallet, dependent: :destroy
    has_many :transactions, dependent: :destroy

    after_create :create_default_wallet

    private
  
    def create_default_wallet
      wallet = create_wallet!
  
      %w[USD CLP BTC USDC USDT].each do |currency|
        wallet.balances.create!(
          currency: currency,
          amount: 0
        )
      end
    end
  end