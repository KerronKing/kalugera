Rails.application.routes.draw do
  root 'articles#index'
  resources :users
  resources :articles
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/news', to: 'articles#news'
  get '/business', to: 'articles#business'
  get '/entertainment', to: 'articles#entertainment'
  get '/tech', to: 'articles#tech'
  get '/sports', to: 'articles#sports'
  get '/opinion', to: 'articles#opinion'
end
