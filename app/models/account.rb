class Account < ApplicationRecord
  validates :title, presence: true
  validates :api_key, presence: true
  validates :secret_key, presence: true
  validates :exchange_market, presence: true, inclusion: { in: ["FTX", "Binance"], message: "%{value} is not a valid exchange market."}
end
