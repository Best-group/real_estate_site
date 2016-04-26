Rails.application.routes.draw do
  get 'user_details/create'

  get 'user_details/destroy'

  get 'user_details/edit'

  get 'user_details/index'

  get 'user_details/new'

  get 'user_details/show'

  get 'user_details/update'

  #match ':controller(/:action(/:id))', :via => :get

  get 'listings/new'

  get 'listings/create'

  get 'listings/update'

  get 'listings/edit'

  get 'listings/destroy'

  get 'listings/index'

  get 'listings/show'

  get 'listings/:id', to: 'listings#display'

  get 'search' => 'listings#show'

  root 'listings#index'
  
  get 'users/details' => 'users#details'

  get 'users/new' => 'users#new'

  get 'users/create'

  post 'users/create' => 'users#create'

  patch 'users/update'

  get 'users/edit'

  delete 'users/destroy'

  get 'users/index'

  get 'users/show'

  resources :users
  resources :listings do
    post :display, on: :member

    collection do
      get :search
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
