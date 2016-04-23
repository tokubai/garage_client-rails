require "rails"

module GarageClient::Rails
  class Railtie < Rails::Railtie
    config.action_dispatch.rescue_responses.merge!(
      'GarageClient::BadRequest'           => :bad_request,
      'GarageClient::Unauthorized'         => :unauthorized,
      'GarageClient::Forbidden'            => :forbidden,
      'GarageClient::NotFound'             => :notfound,
      'GarageClient::NotAcceptable'        => :not_acceptable,
      'GarageClient::Conflict'             => :conflict,
      'GarageClient::UnsupportedMediaType' => :unsupported_media_type,
      'GarageClient::UnprocessableEntity'  => :unprocessable_entity,
      'GarageClient::InternalServerError'  => :internal_server_error,
      'GarageClient::ServiceUnavailable'   => :service_unavailable,
    )

    initializer "garage_client.log_runtime" do
      require "garage_client/rails/controller_runtime"
      ActiveSupport.on_load(:action_controller) do
        include GarageClient::Rails::ControllerRuntime
      end
    end
  end
end
