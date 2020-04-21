Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'
  }
  root 'top#index'
  resources :top
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  resources :products do
    member do
      get 'buy'
      post 'pay', to: 'products#pay'
      get 'done', to: 'products#done'
    end
    collection do  
      
    end
  end


end
