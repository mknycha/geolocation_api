# frozen_string_literal: true

class GeolocationSerializer < ActiveModel::Serializer
  attributes :id, :ip, :ip_type, :country, :city, :longitude, :latitude
end
