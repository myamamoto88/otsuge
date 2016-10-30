Rails.application.routes.draw do
  resources :announcements
  get 'home/index'
  root 'home#index'

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/signout' => 'sessions#destroy'
end
