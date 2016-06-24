require 'spec_helper'
require 'support/simple_logger'
require 'support/some_class'

describe EasyAspects do

  it do
    EasyAspects::Base.configure(SimpleLogger) do
      set_advice(:log)
      at_all_stages
      of(SomeClass, :instance, [:public_methods])
      of(/^Some.lass$/, :singleton, [/a.*method/])
    end

    SomeClass.new.an_instance_method 'INSTANCE METHOD ARG'
    SomeClass.a_singleton_method 'SINGLETON METHOD ARG'
  end

end