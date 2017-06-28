Rails.application.routes.draw do
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  root 'pages#home'

  resources :lists, only: [] do
    resources :items, only: [:create, :destroy]
  end

  resources :users do
    resources :lists
  end

  namespace :api, defaults: {format: :json} do
    resources :users do
      resources :lists
    end
    resources :lists, only: [:index] do
      resources :items, only: [:create]
    end
    resources :items, only: [:destroy, :index]
  end
end
