module EasyAspects
  class Pointcut
    module Class
      class Selector

        attr_accessor :descriptor

        SUPPORTED_DESCRIPTORS = [String, Regexp, ::Class, Module]

        def initialize(descriptor)
          self.descriptor = descriptor
          validate_descriptor!
        end

        def match?(object)
          matcher.match? descriptor, object
        end

        private

        def validate_descriptor!
          diff = [self.descriptor.class] - SUPPORTED_DESCRIPTORS
          raise "you are doing it wrong: descriptor must be of type: #{SUPPORTED_DESCRIPTORS}" if diff.any?
        end

        def matcher
          self.class.const_get "::EasyAspects::Pointcut::Class::Matcher::#{descriptor.class}"
        end

      end
    end
  end
end