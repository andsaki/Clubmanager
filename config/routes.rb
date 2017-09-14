Rails.application.routes.draw do
  get 'messages/show'
  post "messages" => "messages#create"

  get 'members/index'
  get 'members/show'

  get 'groups/index' => "groups#index"
  get 'groups/show'
  get 'groups/new'
  post 'groups' => "groups#create"

  get "groups/my_group"
  get "groups/group"
  get "groups/out_top/:id" => "groups#out_top"
  get "groups/top/:id" => "groups#top"
  get "groups/top_page/:id" => "groups#top_page"
  get "groups/waiting/:id" => "groups#waiting"
  get "groups/delete/:id" => "groups#delete"
  get "groups/delete_member/:id" => "groups#delete_member"

  get "members/application/:id" => "members#application"
  get "members/applicate/:id" => "members#applicate"
  get "members/applicater/:id" => "members#applicater"
  get "members/permit/:group_id&:user_id" => "members#permit"
  get "members/delete/:group_id&:user_id" => "members#delete"
  get "members/retire" => "members#retire"

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
  get "events/exit"
  get "events/neoindex"

  get "posts/club_list"

#  get 'posts/_calender' => 'events#all'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:index, :show]
  as :user do
    get 'users/edit', :to => 'users/registrations#edit', :as => :user_root
  end


  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  root 'groups#index'

end
