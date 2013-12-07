namespace :schema_doc do
  task :out => :environment do
    require 'schema_doc'
    Dir[Rails.root + 'app/models/**/*.rb'].each do |path|
      require path
    end
    puts SchemaDoc::Document.read if !Rake.application.options.silent
  end
end
