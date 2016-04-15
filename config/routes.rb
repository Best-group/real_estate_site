Rails.application.routes.draw do
  root 'users#index'

  get 'users/new' => 'users#new'

  get 'users/create'

  post 'users/create' => 'users#create'

  patch 'users/update'

  get 'users/edit'

  delete 'users/destroy'

  get 'users/index'

  get 'users/show'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
