Rails.application.routes.draw do
  namespace :api do
    resources :geolocations, only: %i[index create show destroy],
                             param: :ip,
                             constraints: {
                               ip: /[0-9A-Za-z\:\.]+/
                             }
  end
end
