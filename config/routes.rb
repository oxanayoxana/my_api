Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    post 'user_token' => 'user_token#create'
    resources :users, only: %i[index create update destroy]
    resources :posts, only: %i[index create update destroy]
  end
end
