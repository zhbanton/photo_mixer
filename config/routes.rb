Rails.application.routes.draw do
  devise_for :users

  resources :images do
    resources :comments, only: [:index, :create]
  end

  root 'images#index'
end
