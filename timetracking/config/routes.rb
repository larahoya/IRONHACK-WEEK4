Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/contact' => 'site#contact'

  resources :project, only: [:index, :show] do
    resources :entries, only: [:index, :new, :create]
  end

  # get '/projects' => 'projects#index'
  # get '/projects/:id' => 'projects#show'
  # get '/projects/:project_id/entries' => 'entries#index'
  # get '/projects/:project_id/entries/new' => 'entries#new'
end
