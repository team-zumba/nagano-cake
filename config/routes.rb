Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  root 'public/homes#top'


  ########## public ##########

  scope module: :public do
    get 'about' => 'homes#about', as: 'about'

    get 'customers/my_page' => 'customers#show', as: 'customer'
    get 'customers/information_edit' => 'customers#edit', as: 'customers_information_edit'
    get 'customers/check' => 'customers#check', as: 'customers_check'
    patch 'customers/information' => 'customers#update', as: 'customers_information'
    patch 'customers/leave' => 'customers#leave', as: 'customers_leave'
    
    resources :customers,     only: [:edit, :update]
    resources :addresses,     except: [:new, :show]
    
    resources :items,         only: [:index, :show] do
      collection do
        get 'genres/:id' => 'items#genre', as: 'genre'
        get 'search' => 'searches#items_search'
      end
    end

    resources :cart_items,    except: [:new, :show, :edit] do
      collection do
        delete :destroy_all
      end
    end

    resources :orders,        only: [:new, :create, :index, :show] do
      collection do
        post :check
        get :complete
      end
    end
  end


  ########## admin ##########
  
  namespace :admin do
    get '/' => 'homes#index', as: 'root'

    resources :customers,     except: [:new, :create, :destroy] do
      member do 
         get 'orders' => 'orders#customer_index'
      end 
      collection do
        get 'search' => 'searches#customers_search'
      end
    end
    resources :genres,        except: [:new, :show, :destroy]
    resources :items,         except: [:destroy]
    resources :order_details, only: [:update]
    resources :orders,        only: [:show, :update, :index]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
