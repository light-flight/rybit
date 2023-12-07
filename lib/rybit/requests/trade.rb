# frozen_string_literal: true

module Rybit
  module Requests
    module Trade
      def create_order(options)
        request(:post, '/v5/order/create', options)
      end

      def get_open_orders(options)
        request(:get, '/v5/order/realtime', options) # category: 'spot'
      end
    end
  end
end
