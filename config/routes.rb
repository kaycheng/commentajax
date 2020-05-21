Rails.application.routes.draw do
  root "stories#index"
  devise_for :users

  resources :stories do
    member do
      post :comment
    end
  end
end
