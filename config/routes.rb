Rails.application.routes.draw do
  get 'user/new' => 'user#new'

  #get 'user/create'

  post 'user/create' => 'user@create'

  get 'user/update'

  get 'user/edit'

  get 'user/destroy'

  get 'user/index'

  get 'user/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
