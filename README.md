# ThesisCloudfront

assumes you are using heroku for CNAME capturing purposes (through the cli), if not it'll skip that step. 
If you aren't using Heroku I highly recommend you check out the rack_cors.rb initializer that's generated and edit it for your purposes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thesis_cloudfront'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thesis_cloudfront

## Usage

run `rails g thesis_cloudfront:install`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nicovigil1/thesis_cloudfront.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
