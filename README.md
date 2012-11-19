# MongoImport

A wrapper to run mongo's `mongoimport` from specs.

## Installation

Add this line to your application's Gemfile:

    gem 'mongo-import'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongo-import

## Usage
1. Create a directory `spec/snapshots`
2. Run `mongoexport`
3. Add a file called `db_name.collection_name.json` to the snapshots directory
4. In your `spec_helper.rb` add:
'''ruby
RSpec.configure do |c|
  c.include MongoImport
end
'''
5. Use in your spec like a boss:
'''ruby
snapshot 'db_name.collection_name'
'''

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
