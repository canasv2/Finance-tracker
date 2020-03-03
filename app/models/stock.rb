class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks
  
  validates  :name, :ticker, presence: true

  def self.new_lookup(ticher_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(ticker: ticher_symbol, name: client.company(ticher_symbol).company_name, last_price: client.price(ticher_symbol) )
    rescue => exception
      return nil
    end
  end
  
  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first    
  end
  
end
