module SimpleLogger

  def log(*args, options, &block)
    write_log get_level_from(options), build_message_for(args, options, &block)
  end

  private

  def get_level_from(options)
    {
      before: :info,
      after: :info,
      around:(options[:return_type].eql?(:success) ? :info : :error)
    }[options[:type]]
  end

  def build_message_for(*args, options, &block)
    proc = block_given? ? Proc.new : nil
    description = {
      before: "will be called with args #{args} and block/proc #{proc ? proc : 'nil'}",
      after: "was called with args #{args} and block/proc #{proc}",
      around: "returned #{options[:return_type]} with: #{options[:return_object]}"
    }[options[:type]]

    "#{options[:class]}##{options[:target]} #{description}"
  end

  def write_log(level, message)
    puts "(#{Time.now}) #{level.upcase}: #{message}"
  end

end