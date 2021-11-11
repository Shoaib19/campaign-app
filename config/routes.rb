Rails.application.routes.draw do

  root to:'home#index'
  devise_for :users
  
  resources :users do
      resources :campaign_tabs do 
      resources :tags
      resources :todos
      resources :comments
      resources :topics do
        resources :comments
      end
    end
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
