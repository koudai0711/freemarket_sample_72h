Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
  }
  root 'top#index'
  resources :top
  resources :products, except: :show
  resources :users, only: :show
end
