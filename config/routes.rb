Rails.application.routes.draw do


  devise_for :admins,controllers: {
    sessions: 'admins/sessions'
  }
  root to:'admin/homes#top'
  
  devise_for :customers
  root to:'public/homes#top'
  

  namespace :public do
    resources :homes
    get'homes/about'=>'homes#about'
    resources :customers
    get '/customers/:id/comfirm' => 'customers#confirm', as: 'confirm'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :addresses
    resources :orders
    resources :items
    resources :cart_items
  end

  namespace :admin do
    resources :homes
    get'top'=>'homes/top'
    resources :customers
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items
    resources :orders
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
