Rails.application.routes.draw do
  resources :post_comments
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :categories
  get '/', to: 'home#index'
  root :to => 'home#index'
  resources:posts
  resources:categories
  get '/about', :to => 'pages#about'
  get '/contact', :to => 'pages#contact'
  get '/resources', :to => 'pages#resources'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)
end
