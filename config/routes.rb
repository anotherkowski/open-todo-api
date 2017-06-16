Rails.application.routes.draw do
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  root 'pages#home'

  resources :lists, only: [] do
    resources :items, only: [:create, :destroy]
  end

  resources :user do
    resources :lists, except: [:index]
  end

  namespace :api, defaults: {format: :json} do
    resources :users
  end
end
