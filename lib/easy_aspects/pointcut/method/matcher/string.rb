module EasyAspects
  class Pointcut
    module Method
      module Matcher
        class String

          class << self

            def all_matches(descriptor, candidates)
              if candidates.include? descriptor.to_sym
                descriptor
              else
                raise NoMethodError.new("undefined method `#{descriptor}'", descriptor)
              end
            end

          end

        end
      end
    end
  end
end