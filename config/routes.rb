Rails.application.routes.draw do
 root to: "sessions#new"
 resources :users, :sessions, :events, :users_events, :comments

  patch 'users'				=> "users#update"

  delete 'sessions/:id'		=> "sessions#destroy"

  patch "events/:id"		=> "events#update"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
