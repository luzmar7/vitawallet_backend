class WalletsController < ApplicationController
  def show
    balances = current_user.wallet.balances

    render json: balances.select(:currency, :amount)
  end
end
