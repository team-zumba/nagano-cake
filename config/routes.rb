Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :public do
    resources :addresses
    resources :cart_items
    resources :confirmation
    resources :customers
    resources :homes
    resources :items
    resources :orders
    resources :application
  end
  
  namespace :admin do
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
