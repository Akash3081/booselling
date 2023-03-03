Rails.application.routes.draw do
  get 'admin' => 'admin#index'
    controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  get 'checkout/create', to: 'checkout#create'
  post 'checkout/create', to: 'checkout#create'

  resources :products do
    get :who_bought, on: :member
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index'
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
