Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :tasks
resources :users, only: [:new, :create, :show, :edit, :update]
resources :sessions, only: [:new, :create, :destroy]
root to: "tasks#index"
end
