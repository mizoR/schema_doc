require 'helper'

describe SchemaDoc::Document do
  it do
  puts SchemaDoc::Document.read
  end
  describe 'send(:template)' do
    let :template do
      SchemaDoc::Document.send(:template, *args)
    end

    context 'When table is "users"' do
      let :args do
        ['users', [User]]
      end

      it 'matches table name' do
        expect(template).to match(/^# #{args[0]}$/)
      end

      it 'matches model name' do
        args[1].each do |model|
          expect(template).to match(/^## #{model.to_s}$/)
        end
      end

      it 'matches header ' do
        expect(template).to match(/^| name | human name | sql type | primary | default | limit |$/)
      end

      it 'matches separator ' do
        expect(template).to match(/^| ---- | ---------- | -------- | ------- | ------- | ----- |$/)
      end

      it 'matches some columns ' do
        args[1].each do |model|
          model.columns.each do |column|
            expect(template).to match(/^| #{column.name} | /)
          end
        end
      end
    end
  end
end
