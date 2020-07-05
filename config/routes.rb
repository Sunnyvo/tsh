
# require 'sidekiq/web'
Rails.application.routes.draw do
  # resources :numerologies
  # mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get "/admin/" => "devise/sessions#new"
    get "/admin/" => "devise/sessions#destroy"
  end

  root to: "pages#index"
  resources :numerologies


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

