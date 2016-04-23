require 'active_support/per_thread_registry'

module GarageClient::Rails
  class RuntimeRegistry
    extend ActiveSupport::PerThreadRegistry

    attr_accessor :garage_client_runtime
  end
end
