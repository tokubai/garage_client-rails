require 'active_support/log_subscriber'
require 'garage_client/rails/runtime_registry'

module GarageClient::Rails
  class LogSubscriber < ActiveSupport::LogSubscriber
    def self.runtime=(value)
      GarageClient::Rails::RuntimeRegistry.garage_client_runtime = value
    end

    def self.runtime
      GarageClient::Rails::RuntimeRegistry.garage_client_runtime ||= 0
    end

    def self.reset_runtime
      rt, self.runtime = runtime, 0
      rt
    end

    def request(event)
      return if logger.nil?
      return unless logger.debug?

      self.class.runtime += event.duration

      payload = event.payload

      name   = color("GarageClient (#{event.duration.round(1)}ms)", GREEN, true)
      method = color(payload[:method].to_s.upcase, WHITE, true)
      url    = color(payload[:url], WHITE, true)
      body   = (payload[:body].nil? ? nil : color(payload[:body], WHITE, false))

      message = ""
      message << "  #{name} #{method} #{url}"
      unless body.blank?
        message << " body=#{body}"
      end

      debug(message)
    end
  end
end

GarageClient::Rails::LogSubscriber.attach_to(:garage_client)
