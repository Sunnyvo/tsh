
# require 'sidekiq/web'
Rails.application.routes.draw do
  # mount Sidekiq::Web => '/sidekiq'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get "/admin/" => "devise/sessions#new"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

