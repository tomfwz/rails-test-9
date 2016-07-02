Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  resources :comments, only: [:create]
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
end
