require 'easy_callbacks'

module EasyAspects
  class Aspect

    attr_accessor :concern, :advices, :stages, :pointcuts

    STAGES = [:before, :around, :after]
    ADVICES_TYPES = [String, Symbol, Regexp]

    def initialize(concern)
      self.concern = concern
      self.advices = []
      self.stages = []
      self.pointcuts = []

      validate_concern!
    end

    def apply_advice(advice)
      apply_advices advice
    end

    def apply_advices(*advices)
      self.advices = advices
      validate_advices!
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

    private

    def validate_concern!
      raise 'you are doing it wrong: concern must be a module' unless concern.is_a? Module
    end

    def validate_advices!
      diff = self.advices.map(&:class) - ADVICES_TYPES
      raise "you are doing it wrong: advices must be of type: #{ADVICES_TYPES}" if diff.any?
    end

    include ::EasyCallbacks::Base

    %w(apply_advices at_all_stages before around after of close).each do |method|
      before method, :validate_state!
    end

    def validate_state!(*args)
      raise "aspect already closed, you can't change it" if closed?
    end

  end
end