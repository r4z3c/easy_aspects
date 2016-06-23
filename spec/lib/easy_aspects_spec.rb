require 'spec_helper'
require 'support/simple_logger'
require 'support/some_class'

describe EasyAspects do

  it do
    my_aspect = EasyAspects.open(SimpleLogger)
    my_aspect.apply_advice(:log).at_all_stages.of(SomeClass, :instance, :public_methods)
    my_aspect.of(/Some.lass/, :singleton, :public_methods)
    my_aspect.close
  end

end