module EasyAspects
  class Advice

    attr_accessor :advice_method

    ADVICE_METHOD_TYPES = [String, Symbol, Regexp, Array]

    def initialize(advice_method)
      self.advice_method = advice_method
      validate_advice_method!
    end

    private

    def validate_advice_method!
      diff = [self.advice_method.class] - ADVICE_METHOD_TYPES
      raise "you are doing it wrong: advice methods must be of type: #{ADVICE_METHOD_TYPES}" if diff.any?
    end

  end
end
