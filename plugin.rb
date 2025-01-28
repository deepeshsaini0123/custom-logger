# frozen_string_literal: true

# name: custom-logger
# about: TODO
# meta_topic_id: TODO
# version: 0.0.1
# authors: Humanx
# url: TODO
# required_version: 2.7.0

enabled_site_setting :custom_logger_enabled

module ::CustomLogger
  PLUGIN_NAME = "custom-logger"
end

after_initialize do

  require_dependency File.expand_path('../lib/custom_logger', __FILE__)
  require_dependency File.expand_path('../lib/custom_mom_logger', __FILE__)
  require_dependency File.expand_path('../lib/custom_logger_override', __FILE__)


  require_dependency File.expand_path("../lib/application_controller_changes.rb", __FILE__)
  ::ApplicationController.class_eval do
    include ::ApplicationControllerChanges
  end

end