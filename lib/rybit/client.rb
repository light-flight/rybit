# frozen_string_literal: true

require 'dry-initializer'

module Rybit
  class Client
    extend Dry::Initializer

    option :endpoint, default: -> { 'https://api.bybit.com' }
    option :key
    option :secret
  end
end
