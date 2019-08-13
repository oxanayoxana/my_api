Rails.application.routes.draw do
  namespace :api do
    post 'user_token' => 'user_token#create'
    resources :users, only: %i[index create update destroy]
  end
end
