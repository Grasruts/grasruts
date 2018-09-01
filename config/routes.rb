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
    resources :news, except: [:index]
    resources :faq, except: [:index]
    resources :contribution
  end

  get '/campaign/:id/rewards', to: 'campaign#rewards', as: 'campaign_rewards'
  get '/campaign/:id/kyc', to: 'campaign#kyc', as: 'campaign_kyc'
  get '/campaign/:id/news', to: 'campaign#news', as: 'campaign_news_list'
  get '/campaign/:id/faq', to: 'campaign#faq', as: 'campaign_faq_list'
  put '/campaign/:id/publish', to: 'campaign#publish', as: 'campaign_publish'

  post '/campaign/froala/upload_image', to: 'campaign#froala_upload_image', as: :froala_upload_image
  get '/download_file/:name', to: 'campaign#access_file', as: :upload_access_file, name: /.*/

  resources :user

  get '/:permalink', to: 'campaign#show', as: :project_by_slug
end
