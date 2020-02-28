class Stock < ApplicationRecord

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
  
end
