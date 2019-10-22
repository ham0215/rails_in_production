Rails.application.routes.draw do
  resources :users
  resources :reviews, only: :index
end
