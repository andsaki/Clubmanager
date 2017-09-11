Rails.application.routes.draw do
  get 'members/index'

  get 'members/show'

  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  post 'groups' => "groups#create"

  get "groups/my_group"
  get "groups/group"
  get "groups/out_top/:id" => "groups#out_top"
  get "groups/top/:id" => "groups#top"
  get "groups/top_page/:id" => "groups#top_page"
  get "groups/waiting/:id" => "groups#waiting"

  get "members/application/:id" => "members#application"
  get "members/applicate/:id" => "members#applicate"
  get "members/applicater/:id" => "members#applicater"
  get "members/permit/:group_id&:user_id" => "members#permit"

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

#  get 'posts/_calender' => 'events#all'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:index, :show]

resources :posts do
  resources :comments, only: [:create, :destroy]
end

 root 'posts#index'

end
