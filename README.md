# Artanis

Sinatra provides a super simple way to define web apps, or more commonly, simple APIs.
This gem aims to do the same thing, but for API clients. So now you can write your Sinatra
and your client in very similar style!

## Example

```ruby

module GithubClient
  include Artanis::Client

  class Users
    include Artanis::Resource

    instance_class User

    # will return a collection of `User` objects
    get '/users', type: :collection

    # will return a single `User` object
    get '/users/:username', type: :instance

    post '/'
  end
end

GithubClient.config do |c|
  c.endpoint "https://api.github.com/"
end


# This generates a client that does the following

client = GithubClient.new(config)

client.users
# returns all users...

client.user(id)
# returns a single user for an ID
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'artanis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install artanis

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/artanis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
