module EasyAspects
  class Pointcut

    attr_accessor :class_selector, :method_type, :method_selector

    CLASS_SELECTOR_TYPES = [String, Regexp, Class, Module]
    METHOD_TYPES = [:instance, :singleton]
    METHOD_SELECTOR_TYPES = [String, Regexp, Symbol]

    def initialize(class_selector, method_type, method_selector)
      self.class_selector = class_selector
      self.method_type = method_type
      self.method_selector = method_selector

      validate!
    end

    private

    def validate!
      validate_class_selector!
      validate_method_type!
      validate_method_selector!
    end

    def validate_class_selector!
      diff = [self.class_selector.class] - CLASS_SELECTOR_TYPES
      raise "you are doing it wrong: class selector must be of type: #{CLASS_SELECTOR_TYPES}" if diff.any?
    end

    def validate_method_type!
      valid = METHOD_TYPES.include? self.method_type
      raise "you are doing it wrong: method type must be one of: #{METHOD_TYPES}" unless valid
    end

    def validate_method_selector!
      diff = [self.method_selector.class] - METHOD_SELECTOR_TYPES
      raise "you are doing it wrong: method selector must be of type: #{METHOD_SELECTOR_TYPES}" if diff.any?
    end

  end
end