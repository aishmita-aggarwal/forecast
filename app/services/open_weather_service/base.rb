module OpenWeatherService
  class Base

    def send_request(type, params = {}, request_body = nil, options = {})
      request(type, params, request_body, options)
    end

    private def connection
      ::Faraday.new(base_url) do |f|
        f.request :url_encoded
        f.adapter :net_http
      end
    end

    private def request(type, params, request_body, options)
      response = connection.public_send(type, request_url, params) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = request_body.to_json if request_body.present?
      end
      response
    end

    private def request_url
      raise 'Must be implemented in Sub Class'
    end

    private def base_url
      Rails.application.credentials.open_weather_base_url
    end

  end
end
