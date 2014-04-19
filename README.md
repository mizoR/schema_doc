# SchemaDoc

SchemaDoc outputs database schema for your Rails applications in markdown style

## Installation

Add this line to your application's Gemfile:

    gem 'schema_doc'

And then execute:

    $ bundle

## Usage

```
$ rake schema_doc:out
```

When your Rails application has following models:

```ruby

class User < ActiveRecord::Base
  has_one :blog, :foreign_key => :owner_id
end

class Blog < ActiveRecord::Base
  has_many   :entries
  belongs_to :owner, :class_name => 'User'
end

class Entry < ActiveRecord::Base
  belongs_to :blog
end
```

SchemaDoc will output [THIS](https://github.com/mizoR/schema_doc/tree/master/example/sample_output.md).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
