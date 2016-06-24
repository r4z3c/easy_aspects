require 'easy_callbacks'

module EasyAspects
  class Aspect

    attr_accessor :concern, :advices, :stages, :pointcuts

    STAGES = [:before, :around, :after]

    def initialize(concern_module)
      self.concern = Concern.new(concern_module)
      self.advices = []
      self.stages = []
      self.pointcuts = []
      @state = :open
    end

    def set_advice(advice)
      set_advices advice
    end

    def set_advices(*advices)
      self.advices += advices.map { |advice| Advice.new advice }
      self
    end

    def at_all_stages
      self.stages = STAGES
      self
    end

    def before
      self.stages.push STAGES[0]
      self
    end

    def around
      self.stages.push STAGES[1]
      self
    end

    def after
      self.stages.push STAGES[2]
      self
    end

    def of(class_selector, method_type, method_selector)
      self.pointcuts.push(Pointcut.new class_selector, method_type, method_selector)
      self
    end

    def close
      @state = :closed
      self
    end

    def closed?
      @state.eql? :closed
    end

    def apply_concern_to(object)
      Applier.new self, object
    end

    private

    include ::EasyCallbacks::Base

    %w(set_advices at_all_stages before around after of close).each do |method|
      before method, :validate_state!
    end

    def validate_state!(*args)
      raise "aspect already closed, you can't change it" if closed?
    end

  end
end