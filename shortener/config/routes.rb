Rails.application.routes.draw do
  get '/' => 'links#index'
  get '/most_visited_pages' => 'links#visited'
  get '/:shortlink' => 'links#search'
  post '/create' => 'links#create'
  get '/show/:id' => 'links#show'
end
