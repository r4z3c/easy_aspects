module EasyAspects
  class Pointcut
    module Method
      module Matcher
        class Symbol

          class << self

            def all_matches(descriptor, candidates)
              if(descriptor.eql? :public_methods)
                candidates
              else
                String.all_matches descriptor, candidates
              end
            end

          end

        end
      end
    end
  end
end