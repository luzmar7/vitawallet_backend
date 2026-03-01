class ExchangesController < ApplicationController
  def create
    result = ExchangeService.new(
      user: current_user,
      from: params[:from_currency],
      to: params[:to_currency],
      amount: params[:amount]
    ).call

    render json: { message: "Exchange successful" }, status: :created
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end