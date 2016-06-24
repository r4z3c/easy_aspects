module EasyAspects
  class Pointcut
    module Method
      module Matcher
        class Regexp

          class << self

            def all_matches(descriptor, candidates)
              candidates.select { |candidate| candidate.to_s.match descriptor }
            end

          end

        end
      end
    end
  end
end