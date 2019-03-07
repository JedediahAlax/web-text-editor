Rails.application.routes.draw do

  get 'textboxes/textbox'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'splash_page#home'
    get '/welcome/loggedIn'
    get '/splash_page/help'
    get 'users/new'
    get '/signup', to: 'users#new'
    get '/login', to: 'sessions#new'
    get '/sessions/new', to: 'users#new'
    get  '/sessions/users/new', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get 'users/show', to: 'users#show'


    resources :users


end
