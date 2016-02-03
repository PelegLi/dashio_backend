Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  unauthenticated do
    resources :items
  end

end
