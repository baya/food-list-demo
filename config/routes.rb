Rails.application.routes.draw do

  get '/login', to: 'session#new', as: 'login'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy', as: 'logout'
  post '/set_language', to: 'session#set_language'
  get '/food_plan', to: 'food_plan#index'

  get '/translation/:key', to: "translation#edit", as:  :translation
  post '/translation/:key', to: "translation#update", as: :save_translation


  root to: 'session#new'
  
end
