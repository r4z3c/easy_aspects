module EasyAspects
  class Aspect
    class Applier

      attr_accessor :aspect, :pointcut, :target

      def initialize(aspect, target)
        self.aspect = aspect
        self.target = target
      end

      def according_to(pointcut)
        self.pointcut = pointcut

        reset_target
        apply(aspect.concern.concern_module, aspect.stages, target_desired_methods, aspect.advices.map(&:advice_method))
      end

      private

      def reset_target
        t = self.pointcut.method_selector.type.eql?(:instance) ? self.target : self.target.singleton_class
        self.target = t
      end

      def apply(concern, stages, target_methods, advice_methods)
        self.target.class_eval do
          include ::EasyCallbacks::Base
          include concern

          stages.each do |stage|
            target_methods.each do |target_method|
              advice_methods.each do |advice_method|
                send stage, target_method, advice_method
              end
            end
          end
        end
      end

      def target_desired_methods
        method_selector.matcher.all_matches(method_selector.descriptor, target_candidate_methods)
      end

      def target_candidate_methods
        self.target.public_instance_methods(false)
      end

      def method_selector
        self.pointcut.method_selector
      end

    end
  end
end