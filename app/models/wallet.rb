class Wallet < ApplicationRecord
  belongs_to :user
  has_many :balances, dependent: :destroy
end
