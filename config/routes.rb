Rails.application.routes.draw do
  resources :web_configs
  root 'web#web_home'
  
  resources :albums do
    resources :galleries
  end
  
  resources :opinions do
    match '/scrape', to: 'opinions#scrape', via: :post, on: :collection
  end

  resources :todo_lists do
    resources :todo_items
  end
  
  resources :services do 
    resources :service_items
  end

  resources :abouts
  resources :awards
  resources :home_banners
  resources :photos
  resources :quotes
 
  get 'sobre-nosotros' => 'web#web_about_us' 
  get 'picmaton' => 'web#web_albums'
  get '/galeria/:album_id', to: 'web#web_album', as: 'galeria'
  get 'resultados' => 'web#web_search_results'
  get 'servicios' => 'web#web_services'
  get '/servicios/:service_id', to: 'web#web_service', as: 'servicio'
  get 'contacto' => 'web#web_contact'
  
  get 'users/index'
  match '/users',   to: 'users#index',   via: 'get'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  as :user do
    get 'login' => 'users/sessions#new'
    post 'login' => 'users/sessions#create'
    get 'signup' => 'users/registrations#new'
    post 'signup' => 'users/registrations#create'
    get 'logout' => 'users/sessions#destroy'
    delete 'logout' => 'users/sessions#destroy'
  end
  # devise_for :users do
  #   # to solve the error [No route matches [GET] "/users/sign_out"]  => https://stackoverflow.com/questions/6567863/no-route-matches-get-users-sign-out
  #   #devise_scope :users do
  #   get '/users/sign_out'   => 'devise/sessions#destroy'
  # end
end
