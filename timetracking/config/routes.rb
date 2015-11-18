Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/contact' => 'site#contact'

  resources :projects, only: [:index, :show, :new, :create] do
    resources :entries, only: [:index, :new, :create, :edit, :update]
  end

  # get '/projects' => 'projects#index'
  # get '/projects/:id' => 'projects#show'
  # get '/projects/:project_id/entries' => 'entries#index'
  # get '/projects/:project_id/entries/new' => 'entries#new'
end
