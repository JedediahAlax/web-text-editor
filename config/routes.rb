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
    # for local server logout to work
    get '/logout', to: 'sessions#destroy'
    # for heroku logout to work
    delete '/logout', to: 'sessions#destroy'
    get 'users/show', to: 'users#show'

    post '/signup', to: 'users#create'

    # don't think we need this anymore
    # put '/users/:id', to: "users#show", as: :user

    resources :users
    resources :user_activation, only: [:edit]
    resources :documents, only: [:create, :destroy, :edit, :new]



end
