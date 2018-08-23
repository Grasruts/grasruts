Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'

  get 'explore', to: 'home#explore'
  resources :campaign do
    resources :reward
  end
  resources :user
end
