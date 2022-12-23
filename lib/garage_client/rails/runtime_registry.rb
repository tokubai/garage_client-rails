require 'active_support/per_thread_registry'

module GarageClient::Rails
  class RuntimeRegistry
    thread_mattr_accessor :garage_client_runtime
  end
end
