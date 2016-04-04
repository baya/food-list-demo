Rails.application.routes.draw do

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  post '/set_language', to: 'session#set_language'

  root to: 'session#new'
  
end
