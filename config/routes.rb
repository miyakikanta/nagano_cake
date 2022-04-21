Rails.application.routes.draw do
  root to: "public/homes#top"

  namespace :public do
    get 'homes/top'
    get 'homes/about'
    
  end
  

 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :public do
    root to: "homes#top"
    post 'orders/comfirm'
    get 'orders/complete'
    get 'customers/unsubscribe'
    patch 'customers/withdraw' =>'customers#withdraw'
    delete 'cart_items/destroy_all'

    resources :items,only:[:index,:show]
    resources :customers,only:[:show,:edit,:update]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    resources :orders,only:[:new,:create,:index,:show] 
 
  end

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    root to: 'homes#top'
    resources :genres,only:[:index,:create,:edit,:update ]
    resources :items,only:[:index,:new,:create,:show,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_details,only:[:update] 
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
