Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/contact' => 'site#contact'

  resources :projects, only: [:index, :show, :new, :create] do
    resources :entries, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :people, only: [:new, :create, :show, :update]

end
