require "schema_doc/version"
require "schema_doc/document"
require "schema_doc/railtie" if defined?(Rails)

module SchemaDoc
  def self.root
    File.expand_path('../..', __FILE__)
  end
end
