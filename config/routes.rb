Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'explore', to: 'home#explore'
end
