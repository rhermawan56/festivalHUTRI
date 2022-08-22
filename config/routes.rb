Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  post 'post', to: 'posts#post'
  get 'post', to: 'posts#posts_form'
  
  get 'assets/:type', to: 'assets#mode'

  post 'create', to: 'users#create'
  get 'signup', to: 'users#signup'
  
  get 'logout', to: 'users#logout'
  post 'login', to: 'users#login'
  get 'login', to: 'users#login_form'
  
  get 'home', to: 'home#index'
  get '/', to: 'home#top'
end
