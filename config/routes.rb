Rails.application.routes.draw do
  get 'posts/:id/new', to: 'posts#new', as: 'posts_new'
  post 'posts' => "posts#create"
  get '/', to: 'gears#index', as: 'gears'
  get 'gears/new', to: 'gears#new', as: 'gears_new'
  get 'gears/:id', to: 'gears#show', as: 'gears_show'
  post 'gears', to: 'gears#create', as: 'gears_create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
