namespace :schema_doc do
  task :out => :environment do
    require 'schema_doc'
    Rails.application.eager_load!
    puts SchemaDoc::Document.read if !Rake.application.options.silent
  end
end
