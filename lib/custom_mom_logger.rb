class CustomMomLogger < Logger
  LOG_FILE = "#{Rails.root}/log/custom_logger.log"

  attr_accessor :message, :input, :output, :correlation_id, :identifier, :code, :error, :request, :event

  def initialize(message: nil, input: nil, output: nil, correlation_id: nil, identifier: nil, code: nil, error: nil, request: nil, event: nil)
    @message = message
    @event = event
    @input = input
    @output = output
    @correlation_id = correlation_id
    @identifier = identifier
    @code = code
    @error = error
    @request = request
  end

  def custom_info(progname = nil)
    add_custom_log('INFO', progname)
  end

  def custom_debug(progname = nil)
    add_custom_log('DEBUG', progname)
  end

  def custom_warn(progname = nil)
    add_custom_log('WARN', progname)
  end

  def custom_error(progname = nil)
    add_custom_log('ERROR', progname)
  end

  def default_structure(level)
    {
      "correlationId" => correlation_id,
      "event" => event,
      "identifier" => identifier,
      "input" => input,
      "label" => "discourse-service",
      "level" => level.underscore,
      "message" => message,
      "output" => output,
      "code" => code,
      "request" => request,
      "timestamp" => Time.now.utc.iso8601(3),
      "error" => error
    }
  end

  def add_custom_log(level, progname)
    log_hash = default_structure(level).compact
    File.open(Rails.root.join("log/custom_logger.log"), "a") do |f|
      f.puts(log_hash)
    end
  end
end