require 'helper'

describe SchemaDoc::Document do
  describe '.read' do
    subject { described_class.read }
    let(:blog) { subject.index('Blog') }
    let(:user) { subject.index('User') }
    let(:another_user) { subject.index('AnotherUser') }

    it 'sorts by tables then model names' do
      expect(another_user).to be < user
      expect(blog).to be < another_user
    end
  end

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
