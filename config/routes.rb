Rails.application.routes.draw do
  root 'boards#index'

  resources :books
end
