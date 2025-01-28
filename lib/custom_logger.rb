# lib/custom_logger.rb
require 'logger'

module CustomLogger
  LOG_FILE = "#{Rails.root}/log/custom_logger.log"

  class DualLogger
    # def initialize
    #   Rails.logger.info("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    #   @default_logger = Rails.logger

    #   # Create a custom logger for the custom log file
    #   @custom_logger = Logger.new(LOG_FILE, 'daily') # 'daily' rotation is optional
    #   @custom_logger.level = Logger::INFO

    #   # Set the log level to be used for both loggers (same level for both)
    #   @level = Logger::INFO
    # end

    # # Set the log level for both loggers
    # def level=(new_level)
    #   @level = new_level
    #   @custom_logger.level = new_level
    #   @default_logger.level = new_level
    # end

    # # Get the current log level
    # def level
    #   @level
    # end

    # # Override specific methods to log to both custom and default loggers
    # def info(*args, &block)
    #   log_to_file('INFO', *args, &block)
    #   @default_logger.info(*args, &block)
    # end

    # def debug(*args, &block)
    #   Rails.logger.info("===========================================================================================")
    #   Rails.logger.info("===========================================================================================")
    #   Rails.logger.info("===========================================================================================")
    #   Rails.logger.info("===========================================================================================")
    #   Rails.logger.info("===========================================================================================")
    #   Rails.logger.info("===========================================================================================")
    #   log_to_file('DEBUG', *args, &block)
    #   @default_logger.debug(*args, &block)
    # end

    # def warn(*args, &block)
    #   log_to_file('WARN', *args, &block)
    #   @default_logger.warn(*args, &block)
    # end

    # def error(*args, &block)
    #   log_to_file('ERROR', *args, &block)
    #   @default_logger.error(*args, &block)
    # end

    # def fatal(*args, &block)
    #   log_to_file('FATAL', *args, &block)
    #   @default_logger.fatal(*args, &block)
    # end

    # def unknown(*args, &block)
    #   log_to_file('UNKNOWN', *args, &block)
    #   @default_logger.unknown(*args, &block)
    # end

    # # For other methods, delegate to the default Rails logger
    # def method_missing(method, *args, &block)
    #   if @default_logger.respond_to?(method)
    #     @default_logger.public_send(method, *args, &block)
    #   else
    #     super
    #   end
    # end

    # def respond_to_missing?(method, include_private = false)
    #   @default_logger.respond_to?(method, include_private) || super
    # end

    # # Method to log to both the custom log file and the default Rails log
    # def log_to_file(severity, message, &block)
    #   # Open the log file and append the message with severity
    #   File.open(LOG_FILE, 'a') do |file|
    #     if block_given?
    #       # If a block is given, capture the block's output
    #       file.puts "[#{Time.now}] #{severity}: #{message} - #{block.call}"
    #     else
    #       file.puts "[#{Time.now}] #{severity}: #{message}"
    #     end
    #   end
    # end
  end
end
