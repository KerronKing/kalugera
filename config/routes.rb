Rails.application.routes.draw do
  root 'articles#index'
  resources :users
  resources :articles
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/current_events', to: 'articles#current'
  get '/business', to: 'articles#business'
  get '/culture', to: 'articles#culture'
  get '/sports', to: 'articles#sports'
  get '/opinion', to: 'articles#opinion'
end
