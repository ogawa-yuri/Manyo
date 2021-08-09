Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "tasks#index"
resources :tasks
resources :users, only: [:new, :create, :show, :edit, :update]
resources :sessions, only: [:new, :create, :destroy]
end
