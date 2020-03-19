# frozen_string_literal: true

class Geolocation < ApplicationRecord
  validates :ip, :ip_type, :country, :city, :longitude, :latitude, presence: true
  validates :ip, uniqueness: true
  # TODO: Add ip validation
end
