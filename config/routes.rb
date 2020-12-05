Rails.application.routes.draw do

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions',
    :passwords => 'customers/passwords'
  }

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :products, only: [:index, :show]
    resources :cart_products, only: [:index, :update, :destroy, :create]
      delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/done' => 'orders#done'
    resource :customers, only: [:edit, :update]
      get 'customers/my_page' => 'customers#show'
      get 'customers/unsubscribe' => 'customers#unsubscribe'
      patch 'customers/withdraw' => 'customers#withdraw'
    resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
  end

  devise_for :admin, :controllers => {
    :registrations => 'admin/registrations',
    :sessions => 'admin/sessions',
    :passwords => 'admin/passwords'
  }

  namespace :admin do
    get '' => 'homes#top'
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end