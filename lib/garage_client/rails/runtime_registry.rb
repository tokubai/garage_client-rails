require 'active_support/core_ext/module/attribute_accessors_per_thread'

module GarageClient::Rails
  class RuntimeRegistry
    thread_mattr_accessor :garage_client_runtime
  end
end
