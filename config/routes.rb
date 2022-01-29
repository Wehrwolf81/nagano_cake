Rails.application.routes.draw do
  
  
  devise_for :admins
  root to: 'admin/homes#top'
  resources :genres, only: [:index, :create, :edit, :update]
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
