Rails.application.routes.draw do
  root 'authors#index'

  resources :author, only: :index
end
