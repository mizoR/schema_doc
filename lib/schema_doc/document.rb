require 'erb'

module SchemaDoc
  class Document
    class << self
      def read
        document = []

        descendants_group_by_table_name.sort.each do |table_name, descendants|
          document << template(table_name, descendants)
        end

        document.join
      end

      private

      def template(table_name, descendant)
        case descendant
        when Array
          "# #{table_name}\n" + descendant.map {|d| template(table_name, d)}.join
        else
          ERB.new(<<MARKDOWN).result(binding)
<%# coding: UTF-8 %>
## <%= descendant %>

| name | human name | sql type | primary | default | limit |
| ---- | ---------- | -------- | ------- | ------- | ----- |
<% descendant.columns.each do |column| %>| <%= column.name %> | <%= descendant.human_attribute_name(column.name) %> | <%= column.sql_type %> | <%= column.primary %> | <%= column.default %> | <%= column.limit %> |
<% end %>
MARKDOWN
        end
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

