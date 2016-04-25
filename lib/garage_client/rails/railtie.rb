require "rails"

module GarageClient::Rails
  class Railtie < Rails::Railtie
    initializer "garage_client.log_runtime" do
      require "garage_client/rails/controller_runtime"
      ActiveSupport.on_load(:action_controller) do
        include GarageClient::Rails::ControllerRuntime
      end
    end
  end
end
