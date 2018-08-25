Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'

  get 'explore', to: 'home#explore'
  resources :campaign do
    resources :reward
  end
  get '/campaign/:id/rewards', to: 'campaign#rewards', as: 'campaign_rewards'
  get '/campaign/:id/kyc', to: 'campaign#kyc', as: 'campaign_kyc'

  resources :user
end
