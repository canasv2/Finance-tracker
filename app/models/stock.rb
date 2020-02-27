class Stock < ApplicationRecord

  def self.new_lookup(ticher_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.price(ticher_symbol)
  end
end
