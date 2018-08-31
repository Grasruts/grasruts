require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'home#index'

  get 'explore', to: 'home#explore'

  resources :campaign do
    resources :reward
  end

  get '/campaign/:id/rewards', to: 'campaign#rewards', as: 'campaign_rewards'
  get '/campaign/:id/kyc', to: 'campaign#kyc', as: 'campaign_kyc'
  put '/campaign/:id/publish', to: 'campaign#publish', as: 'campaign_publish'

  post '/campaign/froala/upload_image', to: 'campaign#froala_upload_image', as: :froala_upload_image
  get '/download_file/:name', to: 'campaign#access_file', as: :upload_access_file, name: /.*/

  resources :user

  get '/:permalink', to: 'campaign#show', as: :project_by_slug
end
