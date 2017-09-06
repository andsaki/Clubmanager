Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  post 'events' => 'events#new'
  get 'events/show/:e_id' => 'events#show'

  get 'home/index'

  get 'home/authentication'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :posts do
  resources :comments, only: [:create, :destroy]
end

 root 'posts#index'

end
