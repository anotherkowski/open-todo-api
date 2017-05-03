Rails.application.routes.draw do
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  root 'pages#home'
  
  resources :lists, only: [] do
    resources :items, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :destroy] do
    resources :lists, except: [:index]
  end
end
