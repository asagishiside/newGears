Rails.application.routes.draw do
  get 'posts/:id/new', to: 'posts#new', as: 'posts_new'
  post 'posts' => "posts#create"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'gears/index'
  get 'gears/show/:id', to: 'gears#show', as: 'gears_show'
  get 'gears/new', as: 'gears_new'
  post 'gears', to: 'gears#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
