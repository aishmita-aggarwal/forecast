module OpenWeatherService
  class City < Base

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def show
      @action = :show
      params = {
        q: CGI.escape(name),
        units: 'imperial',
        appid: Rails.application.credentials.open_weather_api_key
      }

      @response = WeatherTracer.in_span('fetch_city_weather') do |span|
        span.set_attribute('city.name', name)

        send_request('get', params)
      end

      JSON.parse(@response.body)
    end

    private def request_url
      case @action
      when :show
        "/data/2.5/weather"
      end
    end

  end
end
