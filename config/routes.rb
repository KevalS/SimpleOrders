Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post 'authenticate', to: 'authentication#authenticate'
  # root "articles#index"
  namespace :v1 do
    resources :products, only: :index, defaults: { format: :json }
    resources :users, only: :create, defaults: { format: :json }
    resources :items, only: [:create, :destroy], defaults: { format: :json }
    resources :carts, only: [:index, :show], defaults: { format: :json} do
      get :basket, on: :collection
      post :checkout, on: :collection
    end
    get 'orders', to: 'carts#index'
    get 'order/:id', to: 'carts#show'
  end
end
