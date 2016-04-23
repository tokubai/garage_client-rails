module GarageClient
  module RequestInstrumentable
    private

    def request(method, path, params = {}, body = nil, options = {})
      instrument(method, path, params, body) { super }
    end

    def instrument(method, path, params, body)
      ActiveSupport::Notifications.instrumenter.instrument(
        'request.garage_client',
        method: method,
        url: conn.build_url(path, params).to_s,
        body: body,
      ) { yield }
    end
  end
end

GarageClient::Client.prepend(GarageClient::RequestInstrumentable)
