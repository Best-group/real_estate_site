Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
  get 'user/new'

  get 'user/create'
=======
  get 'user/new' => 'user#new'
=======
  root 'users#index'
>>>>>>> Basic_project

  get 'users/new' => 'users#new'

<<<<<<< HEAD
  post 'user/create' => 'user@create'
>>>>>>> Basic_project
=======
  get 'users/create'
>>>>>>> Basic_project

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
