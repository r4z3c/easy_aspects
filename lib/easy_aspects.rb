require 'easy_aspects/loader'

module EasyAspects

  class << self

    def open(concern)
      Aspect.new concern
    end

  end

end