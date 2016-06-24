module EasyAspects
  class Pointcut
    module Method
      class Selector

        attr_accessor :type, :descriptor

        SUPPORTED_TYPES = [:instance, :singleton]
        SUPPORTED_DESCRIPTORS = [String, Regexp, Symbol, Array]

        def initialize(type, descriptor)
          self.type = type
          self.descriptor = descriptor

          validate_type!
          validate_descriptor!
        end

        def matcher
          self.class.const_get "::EasyAspects::Pointcut::Method::Matcher::#{descriptor.class}"
        end

        private

        def validate_type!
          valid = SUPPORTED_TYPES.include? self.type
          raise "you are doing it wrong: type must be one of: #{SUPPORTED_TYPES}" unless valid
        end

        def validate_descriptor!
          diff = [self.descriptor.class] - SUPPORTED_DESCRIPTORS
          raise "you are doing it wrong: descriptor must be of type: #{SUPPORTED_DESCRIPTORS}" if diff.any?
        end

      end
    end
  end
end