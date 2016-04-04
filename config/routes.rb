Rails.application.routes.draw do

  get '/login', to: 'session#new', as: 'login'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy', as: 'logout'
  post '/set_language', to: 'session#set_language'
  get '/food_plan', to: 'food_plan#index'

  root to: 'session#new'
  
end
