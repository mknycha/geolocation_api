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

    def show
      geolocation = Geolocation.find_by!(ip: params[:ip])
      render json: geolocation
    end

    def destroy
      geolocation = Geolocation.find_by!(ip: params[:ip])
      if geolocation.delete
        render json: geolocation, status: :ok
      else
        render json: { errors: { geolocation: 'could not be deleted' } }, status: :internal_server_error
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

    rescue_from(ActiveRecord::RecordNotFound) do |_exception|
      render json: { message: 'record could not be found' }, status: :not_found
    end
  end
end
