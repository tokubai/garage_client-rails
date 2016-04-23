require 'garage_client/rails/log_subscriber'
require 'active_support/core_ext/module/attr_internal'

module GarageClient::Rails
  module ControllerRuntime
    extend ActiveSupport::Concern

    protected

    attr_internal :garage_client_runtime

    def process_action(action, *args)
      GarageClient::Rails::LogSubscriber.reset_runtime
      super
    end

    def append_info_to_payload(payload)
      super
      payload[:garage_client_runtime] = (garage_client_runtime || 0) + GarageClient::Rails::LogSubscriber.reset_runtime
    end

    module ClassMethods
      def log_process_action(payload)
        messages, garage_client_runtime = super, payload[:garage_client_runtime]
        messages << ("GarageClient: %.1fms" % garage_client_runtime.to_f) if garage_client_runtime
        messages
      end
    end
  end
end
