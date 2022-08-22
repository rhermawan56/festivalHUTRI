Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  get '/logout', to: 'users#logout'
  post '/login', to: 'users#login'
  get '/login', to: 'users#login_form'
  
  get '/home', to: 'home#index'
  get '/', to: 'home#top'
end
