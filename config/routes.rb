Rails.application.routes.draw do
  root 'flight#index'

  resources :users
  resources :booking
  resources :flights

  delete "/session", to: "session#destroy"
  post "/session", to: "session#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
