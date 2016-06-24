module EasyAspects
  class Pointcut

    attr_accessor :class_selector, :method_selector

    def initialize(class_selector, method_type, method_selector)
      self.class_selector = Class::Selector.new class_selector
      self.method_selector = Method::Selector.new method_type, method_selector
    end

  end
end