# MigrationLockTimeout

A Ruby gems that adds a lock timeout to all Active Record migrations in your
Ruby on Rails project. Currently only supports PostgreSQL

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'migration-lock-timeout'
```

## Usage

Configure the default lock timeout in a Rails initializer

```ruby
#config/initializers/migration_lock_timeout.rb

MigrationLockTimeout.configure |config|
  config.default_lock_timeout = 5 #timeout in secods
end
```

And that's all! Now every `up` migration will execute
```sql
SET LOCAL lock_timeout = '5s'
```
before your migration mode runs

## Future Plans
- ability to specify timeout in each migration
- ability to work without a default
- ability to disable default timeout in each migration
- specs

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/migration-lock-timeout. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

