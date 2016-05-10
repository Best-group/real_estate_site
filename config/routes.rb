Rails.application.routes.draw do

  root 'searches#index'

  get 'searches/create'

  get 'searches/destroy'

  get 'searches/edit'

  get 'searches/index'

  get 'searches/new'

  get 'searches/show'

  get 'searches/update'

  get 'user_details/create'

  get 'user_details/destroy'

  get 'user_details/edit'

  get 'user_details/index'

  get 'user_details/new'

  get 'user_details/show'

  get 'user_details/update'
  
  post 'user_details/new' => 'user_details#create'
  
  #match ':controller(/:action(/:id))', :via => :get

  get 'listings/new'

  get 'listings/create'

  get 'listings/update'

  get 'listings/edit'

  get 'listings/destroy'

  get 'listings/index'

  get 'listings/show'

  get 'search' => 'searches#show'
  
  get 'users/details' => 'users#details'

  get 'users/new' => 'users#new'

  get 'users/create'

  post 'users/create' => 'users#create'

  patch 'users/update'

  get 'users/edit'

  delete 'users/destroy'

  get 'users/index'

  get 'users/show'



  devise_for :users

  resources :users

  resources :listings

  resources :user_details
  
  #post :display, on: :member

  resources :searches do
    collection do
      get :search
    end
  end

  #devise_scope :users do
  #end

  #get 'listings/:id', to: 'listings#display'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
