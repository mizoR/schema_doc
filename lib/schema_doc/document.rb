require 'erb'

module SchemaDoc
  class Document
    class << self
      def read
        document = []

        descendants_group_by_table_name.sort.each do |table_name, descendants|
          document << table_document(table_name, descendants)
        end

        document.join
      end

      private

      def table_document(table_name, descendants)
        template_path = SchemaDoc.root + '/lib/schema_doc/templates/document_header.md.erb'
        ERB.new(File.read(template_path)).result(binding)
        "# #{table_name}\n" + descendants.map {|d| model_document(table_name, d)}.join
      end

      def model_document(table_name, descendant)
        template_path = SchemaDoc.root + '/lib/schema_doc/templates/document_body.md.erb'
        ERB.new(File.read(template_path)).result(binding)
      end

      def descendants
        ActiveRecord::Base.descendants
      end

      def descendants_group_by_table_name
        descendants.group_by {|descendant|
          descendant.table_name
        }
      end
    end
  end
end

