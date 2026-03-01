class TransactionsController < ApplicationController
  def index
    transactions = current_user.transactions.order(created_at: :desc)

    if params[:status].present?
      transactions = transactions.where(status: params[:status])
    end

    transactions = transactions.page(params[:page]).per(10) if params[:page]

    render json: transactions
  end
end