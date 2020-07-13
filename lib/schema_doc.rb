require "schema_doc/configuration"
require "schema_doc/version"
require "schema_doc/document"
require "schema_doc/railtie" if defined?(Rails)

module SchemaDoc
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.root
    File.expand_path('../..', __FILE__)
  end
end
