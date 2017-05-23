Rails.application.routes.draw do
  get 'home' => 'pages#home'
  get 'about' => 'pages#about'
  root :to => "pages#home"

  resources :lists, only: [] do
    resources :items, only: [:create, :destroy]
  end

  resources :user do
    resources :lists, except: [:index]
  end
end
