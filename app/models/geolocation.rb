# frozen_string_literal: true

class Geolocation < ApplicationRecord
  validates :ip, :ip_type, :country, :city, :longitude, :latitude, presence: true
  validates :ip_type, inclusion: { in: %w[ipv4 ipv6] }
  validates :ip, uniqueness: true
  validate :ip_address_must_be_valid

  def ip_address_must_be_valid
    return if ip_valid?(ip)

    errors.add(:ip, 'is invalid')
  end

  def ip_valid?(ip)
    (ip_type == 'ipv4' && IPAddress.valid_ipv4?(ip)) ||
      (ip_type == 'ipv6' && IPAddress.valid_ipv6?(ip))
  end
end
