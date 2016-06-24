module EasyAspects
  class Pointcut
    module Class
      module Matcher
        class String

          class << self

            def match?(descriptor, target)
              descriptor.eql? target.to_s
            end

          end

        end
      end
    end
  end
end