# lib/custom_logger.rb (or wherever you want to define it)

module CustomLoggerOverride

  def info(progname = nil, &block)
    add_custom_log('INFO', progname, block)
    CustomMomLogger.new(message: "#{progname}").custom_info

    super(progname, &block)
  end


  def debug(progname = nil, &block)
    add_custom_log('DEBUG', progname, block)
    input_params = params.to_unsafe_h rescue nil
    CustomMomLogger.new(input: input_params, message: "#{progname}").custom_debug

    super(progname, &block)
  end

  def warn(progname = nil, &block)
    add_custom_log('WARN', progname, block)
    CustomMomLogger.new(message: "#{progname}").custom_warn

    super(progname, &block)
  end

  def error(progname = nil, &block)
    add_custom_log('ERROR', progname, block)
    CustomMomLogger.new(message: "#{progname}").custom_error

    super(progname, &block)
  end

  def add_custom_log(method_name, progname, block)
    File.open(Rails.root.join("log/custom.log"), "a") do |f|
      string_log = "#{method_name}: progname: #{progname}: block: #{block}"
      f.puts(string_log)
    end
  end
end
