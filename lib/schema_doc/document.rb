require 'erb'

module SchemaDoc
  class Document
    class << self
      def read
        document = []

        model_classes_group_by_table_name.sort_by {|k, _| k }.each do |table_name, model_classes|
          document << table_document(table_name, model_classes)
        end

        document.join
      end

      private

      def table_document(table_name, model_classes)
        template_path = SchemaDoc.root + '/lib/schema_doc/templates/document_header.md.erb'
        ERB.new(File.read(template_path)).result(binding)
        "# #{table_name}\n" + model_classes.map { |model_class|
          model_document(table_name, model_class)
        }.join
      end

      def model_document(table_name, model_class)
        template_path = SchemaDoc.root + '/lib/schema_doc/templates/document_body.md.erb'
        ERB.new(File.read(template_path)).result(binding)
      end

      def model_classes
        ActiveRecord::Base.descendants
      end

      def model_classes_group_by_table_name
        model_classes.select(&:table_exists?).group_by {|model_class|
          model_class.table_name
        }
      end
    end
  end
end

