module SchemaDoc
  class Configuration
    attr_accessor :model_classes
    
    def initialize
      @model_classes = Proc.new { ActiveRecord::Base.descendants }
    end
  end
end