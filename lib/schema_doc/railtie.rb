# coding: utf-8
module SchemaDoc
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'schema_doc/tasks.rake'
    end
  end
end

