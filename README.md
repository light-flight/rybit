# Rybit

Bybit API client

## Installation

```ruby
gem 'rybit' # in your Gemfile
```

## Usage

```ruby
client = Rybit::Client.new(
  key: '<your API KEY>',
  key: '<your SECRET KEY>'
)

client.get_wallet_balance
```

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
