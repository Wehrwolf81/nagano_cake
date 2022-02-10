Rails.application.routes.draw do


  devise_for :admins,controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers
  
  namespace :public do
    resources :homes
    root to:'homes#top'
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
    root to:'homes#top'
    resources :customers
    resources :genres
    resources :items
    resources :orders
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
