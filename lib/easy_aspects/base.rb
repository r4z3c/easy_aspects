require 'easy_callbacks'

module EasyAspects
  class Base

    class << self

      def configure(concern, &block)
        aspect = Aspect.new concern
        aspect.instance_eval &block
        aspect
      end

      private

      include ::EasyCallbacks::Base

      around :configure, :apply

      def apply(*args, callback_details)
        if(callback_details[:return_type].eql? :success)
          aspect = callback_details[:return_object]

          ObjectSpace.each_object do |object|
            next unless [Module,Class].include? object.class

            aspect.pointcuts.select do |pointcut|
              pointcut.class_selector.match? object
            end.each do |pointcut|
              aspect.apply_concern_to(object).according_to(pointcut)
            end
          end
        end
      end

    end

  end
end