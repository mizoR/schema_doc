namespace :schema_doc do
  task :out => :environment do
    require 'schema_doc'
    if defined?(Rails)
      Rails.application.eager_load!
    else
      Dir[Rails.root + 'app/models/**/*.rb'].each do |path|
        require path
      end
    end
    puts SchemaDoc::Document.read if !Rake.application.options.silent
  end
end
