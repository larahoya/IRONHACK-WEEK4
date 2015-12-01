Rails.application.routes.draw do
  
  get '/' => 'site#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/products' => 'products#list'

  resources :users, only: [:new, :create, :show, :destroy] do
    resources :products, only: [:index, :show, :create, :destroy, :new] do
      resources :bids, only: [:create]
      resources :reviews, only: [:create, :destroy, :update]
    end
    resources :ratings, only: [:create]
  end

end
