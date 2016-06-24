module EasyAspects
  class Pointcut
    module Method
      module Matcher
        class Array

          class << self

            def all_matches(descriptors, candidates)
              descriptors.map do |descriptor|
                matcher = EasyAspects::Pointcut::Method::Matcher.const_get descriptor.class.to_s
                matcher.all_matches descriptor, candidates
              end.flatten.compact.uniq
            end

          end

        end
      end
    end
  end
end