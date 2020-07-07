require 'schema_doc'
require 'active_record'

dbfile = File.join(SchemaDoc.root, 'spec/db/test.sqlite3')
if File.exist?(dbfile)
  File.delete(dbfile)
end

locales_dir = File.join(SchemaDoc.root, 'spec/locales')
I18n.load_path << locales_dir + '/en.yml'

ActiveRecord::Base.establish_connection(
  'adapter'  => 'sqlite3',
  'database' => dbfile
)

class CreateUsers < ActiveRecord::Migration[6.0]
  def self.up
    create_table :users do |t|
      t.string  :nick
    end
  end

  def self.down
    drop_table :users
  end
end

class CreateBlogs < ActiveRecord::Migration[6.0]
  def self.up
    create_table :blogs do |t|
      t.string  :name
      t.integer :owner_id
    end
  end

  def self.down
    drop_table :blogs
  end
end

class CreateEntries < ActiveRecord::Migration[6.0]
  def self.up
    create_table :entries do|t|
      t.string  :title
      t.string  :body
    end
  end

  def self.down
    drop_table :entries
  end
end

[CreateUsers, CreateBlogs, CreateEntries].map(&:new).each(&:up)

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
