Rails.application.routes.draw do
  get '/contacts' => 'contacts#index'
  get '/contacts/new' => 'contacts#new'
  post '/contacts' => 'contacts#create'
  get '/contacts/:id' => 'contacts#show'
  get '/favorites/:id' => 'contacts#add_favorite'
  get '/favorites' => 'contacts#favorites'
end
