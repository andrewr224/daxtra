# Daxtra

[![Build Status](https://semaphoreci.com/api/v1/andrewr224/daxtra/branches/master/badge.svg)](https://semaphoreci.com/andrewr224/daxtra)
[![Gem Version](https://badge.fury.io/rb/daxtra.svg)](https://badge.fury.io/rb/daxtra)

Daxtra gem is a minute client for daXtra [REST API](http://cvxdemo.daxtra.com/cvx/#integration-rest) that is used to parse and convert resumes.

Learn more about daXtra at their [website](https://www.daxtra.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daxtra'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daxtra

## Usage

First, you need to have an account at daXtra; you can use test account for testing and development

Create a client object with the following code:

```ruby
client = Daxtra::Client.new(account: "test")
```
You can pass in a server name as a second key argument if you have one (`server: "your-server"`).


When that's set, your client object has two methods:

`#post_profile_full`
`client.post_profile_full(file)` will return parsed resume from daXtra.

`#post_convert_2_html`
`client.post_convert_2_html(file)` will return resume as an html (xml, to be honest) converted by daXtra.

The `file` argument in the examples above is your resume as a string read from the actual file. E.g., if you're using Paperclip gem, this looks like the following:
`Paperclip.io_adapters.for(attachment).read`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub project's [page](https://github.com/andrewr224/daxtra).. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Daxtra project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/daxtra/blob/master/CODE_OF_CONDUCT.md).
