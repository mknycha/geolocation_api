Rails.application.routes.draw do
  namespace :api do
    resources :geolocations, only: [:index, :create, :show, :destroy], param: :ip, :constraints => { :ip => /[0-9A-Za-z\:\.]+/ }
  end
end
