# frozen_string_literal: true

module Rybit
  class Client
    include HTTParty
    include Requests::Account
    include Requests::Trade

    attr_accessor :api_key, :secret_key, :testnet, :base_url, :recv_window

    # debug_output $stdout

    def initialize(api_key:, secret_key:, testnet: false, recv_window: '5000')
      @api_key = api_key
      @secret_key = secret_key
      @testnet = testnet
      @recv_window = recv_window
      @base_url = "https://#{testnet ? 'api-testnet' : 'api'}.bybit.com"
    end

    def request(method, endpoint, payload = {})
      full_url = base_url + endpoint
      timestamp = DateTime.now.strftime('%Q')
      payload = method == :post ? payload.to_json : HTTParty::HashConversions.to_params(payload)
      headers = {
        'X-BAPI-API-KEY' => api_key,
        'X-BAPI-TIMESTAMP' => timestamp,
        'X-BAPI-RECV-WINDOW' => recv_window,
        'X-BAPI-SIGN' => signature(payload, timestamp),
        'Content-Type' => ('application/json' if method == :post)
      }.compact

      wrapper = method == :post ? :body : :query
      response = self.class.send(method, full_url, wrapper => payload, headers: headers)
      response.body
    end

    private

    def signature(payload, timestamp)
      param_str = timestamp + api_key + recv_window + payload
      OpenSSL::HMAC.hexdigest('sha256', secret_key, param_str)
    end
  end
end
