class Stock < ApplicationRecord
  belongs_to :user
  validates :ticker, presence: true
  validate :valid_ticker?

  def valid_ticker?
    StockQuote::Stock.new(api_key: "pk_03f609bd3ac74f70b35c77418535c946")
     begin
      ticker = StockQuote::Stock.quote(ticker)
     rescue =>e
      errors.add(:ticker, "can't be invalid. Insert a valid symbol")
     end
  end
end
