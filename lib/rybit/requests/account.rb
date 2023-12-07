# frozen_string_literal: true

module Rybit
  module Requests
    module Account
      def get_wallet_balance(payload)
        request(:get, '/v5/account/wallet-balance', payload)
      end
    end
  end
end
