# frozen_string_literal: true

module Api
  class GeolocationsController < ApplicationController
    def create
      geolocation = Geolocation.new(geolocation_params)
      if geolocation.save
        render json: geolocation, status: :ok
      else
        render json: { errors: geolocation.errors }, status: :unprocessable_entity
      end
    end

    private

    def geolocation_params
      params.require(:geolocation).permit(:ip, :ip_type, :country, :city, :longitude, :latitude)
    end

    rescue_from(ActionController::ParameterMissing) do |exception|
      error = { exception.param => ['parameter is required'] }
      render json: { errors: error }, status: :unprocessable_entity
    end
  end
end
