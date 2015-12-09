# InchByInch

A rake task to make validating your documentation comments as easy as running
a single command.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'inch_by_inch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inch_by_inch

## Usage

In your `Rakefile`, add the following:

```ruby
# Rakefile
require 'inch_by_inch/rake_task'
InchByInch::RakeTask.new
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can
also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `rake install`. To
release a new version, update the version number in `version.rb`, commit,
and then run `rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/segiddins/inch_by_inch. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).
