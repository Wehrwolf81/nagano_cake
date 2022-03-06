Rails.application.routes.draw do


  devise_for :admins,controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers,controllers: {
    sessions: 'customers/sessions'
  }

  # namespace :public do

    root to:'homes#top'
    get'homes/about'=>'homes#about'
    resources :homes
    resources :customers
    get '/customers/:id/comfirm' => 'customers#confirm', as: 'confirm'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :addresses
    post'/orders/confirm' =>'orders#confirm',as: 'order_confirm'
    get'/orders/complete' =>'orders#complete',as: 'complete'
    resources :orders
    resources :items
    resources :cart_items
    delete '/cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
  # end

  namespace :admin do
    resources :homes
    root to:'homes#top'
    resources :customers
    resources :genres
    resources :items
    resources :orders  , only: [:show, :update]
    resources :order_details  , only: [:update]
    # post'/orders/update_order_status' =>'order#update_order_status',as: 'order_status'
    # post'/orders/update_making_status' =>'order#update_making_status',as: 'order_making_status'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
