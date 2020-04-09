Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :top
  resources :products, except: :show
  resources :registrations
  resources :sessions
end
