Rails.application.routes.draw do



# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  resources :subs, only: [:index, :show, :new, :create, :edit, :update, :destroy] do 
    resources :posts, only: [:index, :new]
  end
  resources :posts, except: [:index, :new]


end
