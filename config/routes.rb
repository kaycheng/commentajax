Rails.application.routes.draw do
  root "stories#index"
  devise_for :users

  resources :stories do
    resources :comments, only: :create
  end
end
