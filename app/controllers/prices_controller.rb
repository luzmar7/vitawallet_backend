class PricesController < ApplicationController
  def quote
    result = PriceService.quote(
      from: params[:from_currency],
      to: params[:to_currency],
      amount: params[:amount]
    )

    if result
      render json: result
    else
      render json: { error: "Price unavailable" }, status: :unprocessable_entity
    end
  end
end