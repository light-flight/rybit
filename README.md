# Rybit

Bybit API client

## Installation

```ruby
gem 'rybit' # in your Gemfile
```

## Usage

```ruby
client = Rybit::Client.new(
  api_key: '<your API KEY>',
  secret_key: '<your SECRET KEY>',
  # testnet: <boolean> (default false)
)

client.get_wallet_balance(accountType: 'CONTRACT')

client.create_order(
  category: 'linear',
  symbol: 'BTCUSDT',
  side: 'Buy',
  positionIdx: 0,
  orderType: 'Limit',
  qty: '0.001',
  price: '10000',
  timeInForce: 'GTC',
  orderLinkId: SecureRandom.uuid
)
```

NOTE: tesnet credentials are created separately on https://testnet.bybit.com/app/user/api-management

## Development

* `bin/setup` to install dependencies
* `rake spec` to run the tests
* `bin/console` for an interactive prompt
---
* `bundle exec rake install` to install this gem onto your local machine

## Release

1. Update the version number in `version.rb`
2. Run `bundle exec rake release`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/light-flight/rybit.
