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
2. Run `mongoexport` and  redirect to a file called `db_name.collection_name.json` to the snapshots directory
3. In your `spec_helper.rb` add:

```ruby
RSpec.configure do |c|
  c.include MongoImport
end
```

4. Use in your spec like a boss:

```ruby
snapshot 'db_name.collection_name'
```
or
```ruby
snapshot 'file_name', :db => 'db_name', :collection => 'collection_name', :path => 'spec/snapshots'
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
