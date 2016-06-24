module EasyAspects
  class Pointcut
    module Class
      module Matcher
        class Module

          class << self

            def match?(descriptor, target)
              raise :not_implemented
            end

          end

        end
      end
    end
  end
end