require 'helper'

describe SchemaDoc::Document do
  describe 'send(:table_document)' do
    let :document do
      SchemaDoc::Document.send(:table_document, *args)
    end

    context 'When table is "users"' do
      let :args do
        ['users', [User]]
      end

      it 'matches table name' do
        expect(document).to match(/^# #{args[0]}$/)
      end

      it 'matches model name' do
        args[1].each do |model|
          expect(document).to match(/^## #{model.to_s}$/)
        end
      end

      it 'matches header ' do
        expect(document).to match(/^| name | human name | sql type | primary | default | limit |$/)
      end

      it 'matches separator ' do
        expect(document).to match(/^| ---- | ---------- | -------- | ------- | ------- | ----- |$/)
      end

      it 'matches some columns ' do
        args[1].each do |model|
          model.columns.each do |column|
            expect(document).to match(/^| #{column.name} | /)
          end
        end
      end
    end
  end
end
