Rails.application.routes.draw do
  resources :announcements
  root 'announcements#index'

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/signout' => 'sessions#destroy'
end
