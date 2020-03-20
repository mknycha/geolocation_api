FactoryBot.define do
  factory :geolocation do
    ip { Faker::Internet.ip_v6_address }
    ip_type { 'ipv6' }
    country { Faker::Address.country }
    city { Faker::Address.city }
    longitude { Faker::Address.longitude }
    latitude { Faker::Address.latitude }
  end
end
