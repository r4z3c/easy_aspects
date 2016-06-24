module EasyAspects
  class Pointcut
    module Class
      module Matcher
        class Regexp

          class << self

            def match?(descriptor, target)
              target.to_s.match(descriptor) ? true : false
            end

          end

        end
      end
    end
  end
end