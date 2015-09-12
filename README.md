# Paperclip::Storage::Fake

`Paperclip::Storage::Fake` stubs out all Paperclip IO operation.  Useful in specs.

## Justification

Faster specs.  How much do you actually test the content of attachments in your model specs?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paperclip-fake-storage'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-fake-storage

## Usage

In your `config/environments/test.rb` file:

``` ruby
  config.paperclip_defaults = { storage: :fake }
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/paperclip-fake-storage/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

