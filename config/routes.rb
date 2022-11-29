Rails.application.routes.draw do

  resources :campers, except: [:destroy, :update]

  resources :activities, only: [:index, :destroy]

  resources :signups, only: [:create]
end
