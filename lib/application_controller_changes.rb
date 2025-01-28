module ApplicationControllerChanges
  def self.included(base)
    base.class_eval do
      after_action :add_application_log

      rescue_from Exception, with: :log_and_handle_error

      private

      def add_application_log
        controller = controller_name rescue nil
        action = action_name rescue nil
        input_params = get_input_params
        output_params = response.body if response.content_type == 'application/json'

        CustomMomLogger.new(correlation_id: SecureRandom.uuid, event: action, input: input_params, output: output_params, message: "#{controller}:#{action}", request: (request.path rescue nil)).custom_debug
      end

      def log_and_handle_error(exception)
        controller = controller_name rescue nil
        action = action_name rescue nil
        input_params = get_input_params rescue nil

        CustomMomLogger.new(input: input_params, event: action, output: exception.to_s, message: "#{controller}:#{action}").custom_error
        raise exception
      end

      def get_input_params
        request.headers.each_with_object({}) do |(key, value), headers_hash|
          if key.start_with?('HTTP_')
            # Remove the "HTTP_" prefix and format the key
            formatted_key = key.sub(/^HTTP_/, '').split('_').map(&:capitalize).join('-')
            headers_hash[formatted_key] = value
          end
        end
      end
    end
  end
end