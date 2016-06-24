module EasyAspects
  class Pointcut
    module Class
      module Matcher
        class Class

          class << self

            def match?(descriptor, target)
              ::EasyAspects::Pointcut::Class::Matcher::String.match? descriptor.to_s, target
            end

          end

        end
      end
    end
  end
end