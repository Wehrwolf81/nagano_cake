Rails.application.routes.draw do
  
  root to:'admin/homes#top'
  devise_for :customers
  devise_for :admins
 
  # resources :admin/homes
  # resources :admin/customers
  # resources :admin/genres, only: [:index, :create, :edit, :update]
  # resources :admin/items
  # resources :admin/orders
  # resources :public/homes
  # resources :public/customers
  # resources :public/addresses
  # resources :public/oders
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
