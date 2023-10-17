Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  root 'public/homes#top'
  get 'about' => 'public/homes#about', as: 'about'
  
  scope module: :public do
    
    get 'customers/my_page' => 'customers#show', as: 'customer'
    get 'customers/information_edit' => 'customers#edit', as: 'customers_information_edit'
    patch 'customers/information' => 'customers#update', as: 'customers_information'
    get 'customers/check' => 'customers#check', as: 'customers_check'
    patch 'customers/leave' => 'customers#leave', as: 'customers_leave'
    
    resources :addresses
    resources :cart_items do
      collection do
        delete :destroy_all
      end
    end
    
    resources :confirmation
    resources :customers
    resources :homes
    resources :items, only: [:index, :show]
    resources :orders do
      collection do
        post :check
        get :complete
      end
    end
    resources :application
    get 'genres/filter/:id' => 'genres#fliter', as: :genres_filter
  end
  
  namespace :admin do
    
    get 'orders/show' => 'orders#show', as: 'orders'
    
    resources :customers
    resources :genres
    resources :homes
    resources :items
    resources :order_details
    resources :orders
  end
  
  
  
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
