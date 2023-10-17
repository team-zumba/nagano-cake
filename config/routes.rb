Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  root 'public/homes#top'
  
  scope module: :public do
    resources :addresses
    resources :cart_items
    resources :confirmation
    resources :customers
    resources :homes
    resources :items
    resources :orders, only: [:index]
    resources :application
    get 'genres/filter/:id' => 'genres#fliter', as: :genres_filter
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
