Rails.application.routes.draw do
  namespace :api do
    resources :geolocations, only: [:create, :destroy], param: :ip, :constraints => { :ip => /[0-9A-Za-z\:\.]+/ }
  end
end
