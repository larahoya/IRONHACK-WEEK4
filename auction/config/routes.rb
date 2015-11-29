Rails.application.routes.draw do
  
  get '/' => 'site#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/products' => 'products#list'

  resources :users, only: [:new, :create, :show, :destroy] do
    resources :products, only: [:index, :show, :create, :destroy, :new] do
      resources :bids, only: [:new, :create]
    end
  end

end
