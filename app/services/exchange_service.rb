class ExchangeService
    def initialize(user:, from:, to:, amount:)
      @user = user
      @from = from
      @to = to
      @amount = BigDecimal(amount)
    end
  
    def call
      ActiveRecord::Base.transaction do
        validate_balance!
  
        quote = PriceService.quote(
          from: @from,
          to: @to,
          amount: @amount
        )
  
        raise "Price unavailable" unless quote
  
        to_amount = BigDecimal(quote[:to_amount])
  
        debit!
        credit!(to_amount)
  
        Transaction.create!(
          user: @user,
          from_currency: @from,
          to_currency: @to,
          from_amount: @amount,
          to_amount: to_amount,
          status: :completed
        )
      end
    rescue => e
      Transaction.create!(
        user: @user,
        from_currency: @from,
        to_currency: @to,
        from_amount: @amount,
        status: :rejected
      )
      raise e
    end
  
    private
  
    def validate_balance!
      balance = find_balance(@from)
      raise "Insufficient funds" if balance.amount < @amount
    end
  
    def debit!
      balance = find_balance(@from)
      balance.update!(amount: balance.amount - @amount)
    end
  
    def credit!(amount)
      balance = find_balance(@to)
      balance.update!(amount: balance.amount + amount)
    end
  
    def find_balance(currency)
      @user.wallet.balances.find_by!(currency: currency)
    end
  end