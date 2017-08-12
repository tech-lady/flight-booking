Rails.application.routes.draw do
  root "home#index"

  resources :users
  resources :booking
  resources :flight

  delete "/session", to: "session#destroy"
  resources :session, only: [:create, :new,]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
