Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'

  get 'events/index'
  get 'events/new'
  get 'events/new_from_cal'
  post 'events' => 'events#create'

  get 'events/show/:e_id' => 'events#show'
  get 'events/delete/:e_id' => 'events#delete'
  get 'events/edit/:e_id' => 'events#edit'
  get 'events/attend/:e_id' => 'events#attend'
  get 'events/absence/:e_id' => 'events#absence'
  get 'events/calender/:num' => 'events#calender'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:index, :show]

resources :posts do
  resources :comments, only: [:create, :destroy]
end

 root 'posts#index'

end
