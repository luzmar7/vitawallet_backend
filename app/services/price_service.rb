class PriceService
  include HTTParty
  base_uri "https://api.stage.vitawallet.io"

  def self.quote(from:, to:, amount:)
    data = Rails.cache.fetch("prices_snapshot", expires_in: 30.seconds) do
      response = get("/api/prices_quote")
      raise "Price fetch error" unless response.success?
      response.parsed_response
    end

    rate = extract_rate(data, from, to)
    raise "Rate not found" unless rate

    amount = BigDecimal(amount)
    to_amount = amount * BigDecimal(rate)

    {
      from_currency: from,
      to_currency: to,
      rate: rate,
      from_amount: amount.to_s,
      to_amount: to_amount.to_s
    }
  rescue => e
    Rails.logger.error("PriceService error: #{e.message}")
    nil
  end

  def self.extract_rate(data, from, to)
    base_currency = to.downcase
    quote_currency = from.downcase

    return nil unless data[base_currency]

    data[base_currency]["#{quote_currency}_buy"]
  end
end