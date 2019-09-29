Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  get '/users', to: 'users#index', as: 'users'  #'as' refer to Route name
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new', as: 'new_user'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:id/edit', to: 'users#edit', as: 'user_edit'
  patch 'users/:id', to: 'users#update', as: 'user_patch'
  put 'users/:id', to: 'users#update', as: 'user_put'
  delete 'users/:id', to: 'users#destroy', as: 'user_delete'
end
