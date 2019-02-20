Rails.application.routes.draw do

  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'splash_page#home'
    get '/welcome/loggedIn'
    get '/welcome/help'
    get 'users/new'
    get '/signup', to: 'users#new'
    get '/login', to: 'sessions#new'
    get '/sessions/new', to: 'users#new'
    get  '/sessions/users/new', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    resources :users
<<<<<<< HEAD
  
=======

>>>>>>> login
end
