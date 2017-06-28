Rails.application.routes.draw do
  
  get 'basketball/index'

  devise_for :users
  root 'posts#index'
  resources :posts, except: [:show]
  get '/posts/baseball' => 'baseball#index'
  get '/posts/basketball' => 'basketball#index'
  get '/posts/index' => 'posts#index'
end
