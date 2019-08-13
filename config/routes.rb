Rails.application.routes.draw do
  root to: 'teddies#index'
  resources :teddies, only: [:index, :show]
  resources :wewebs, only: [:index, :show]
  resources :orders, only: [:create, :show] do
    resource :payment, only: [:show]
  end
  post "wx_notify", to: "payments#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
