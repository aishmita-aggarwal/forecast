module Api
  module V1
    class WeatherController < BaseController

      before_action :validate_city_name, only: :show

      def show
        data = OpenWeatherService::City.new(@city_name).show
        render json: { data: data }, status: :ok
      end

      private def validate_city_name
        unless (@city_name = params[:city_name]).present?
          render json: { message: "City not found" }, status: :not_found
        end
      end

    end
  end
end
