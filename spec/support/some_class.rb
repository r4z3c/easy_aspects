class SomeClass

  def an_instance_method(some_arg)
    message = "an_instance_method #{some_arg}"
    puts message or message
  end

  class << self

    def a_singleton_method(some_arg)
      message = "an_singleton_method #{some_arg}"
      puts message or message
    end

  end

end