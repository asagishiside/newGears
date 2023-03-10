Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'gears/index'
  get 'gears/show/:id', to: 'gears#show'
  get 'gears/new', as: 'gears_new'
  post 'gears', to: 'gears#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
