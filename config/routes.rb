Rails.application.routes.draw do
  get 'airport/index'

  root "home#index"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get "flights" => "flights#index"
  post "flights/search" => "flights#search"

  resources :airports
  resources :users
  resources :bookings
  resources :flights
  resources :airport
  resources :passenger

  delete "/session", to: "session#destroy"
  resources :session, only: [:create, :new,]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
