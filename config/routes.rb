Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
 
  get 'categories/index'
  get 'categories/new'
  get 'categories/edit'
  get 'categories/show'
  get 'home/index'
  root :to=> 'home#index'
  resources :posts
  resources :categories
  ActiveAdmin.routes(self)
end
