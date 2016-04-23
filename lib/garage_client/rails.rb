require 'garage_client'

module GarageClient
  require 'garage_client/request_instrumentable'

  module Rails
    require 'garage_client/rails/version'
    require 'garage_client/rails/railtie'
  end
end
