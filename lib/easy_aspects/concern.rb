module EasyAspects
  class Concern

    attr_accessor :concern_module

    def initialize(concern_module)
      self.concern_module = concern_module
      validate_concern_module!
    end

    private

    def validate_concern_module!
      raise 'you are doing it wrong: concern module must be a module' unless self.concern_module.is_a? Module
    end

  end
end