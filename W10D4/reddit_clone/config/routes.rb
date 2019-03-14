Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :new] 

  resource :session, only: [:new, :create, :destroy]

  resources :users do 
    resources :subs, only: [:update, :edit]
  end

  resources :subs, only: [:new, :index, :create, :show, :destroy]

  resources :posts
  
end
