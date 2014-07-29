Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}

  resources :images, only: [:index, :new, :create] do
    resource :vote, only: :update, defaults: { votable_type: 'Image' }
    resources :comments, only: [:index, :create]
  end
  resources :comments, only: [:show] do
    resource :vote, only: :update, defaults: { votable_type: 'Comment' }
  end

  resources :users, only: [] do
    resource :images, only: [:show]
    resource :comments, only: [:show]
  end

  resources :favorites, only: [:create, :destroy]

  root to: 'images#index'
end
