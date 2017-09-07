Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  get 'events/index'
  get 'events/new'
  post 'events' => 'events#create'
  get 'events/show/:e_id' => 'events#show'




  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:index, :show]

resources :posts do
  resources :comments, only: [:create, :destroy]
end

 root 'posts#index'

end
