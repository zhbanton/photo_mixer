Rails.application.routes.draw do

  get 'tags/:tag', to: 'images#index', as: :tag
  get '/profile/:id', to: "profile#show", as: :profile

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :images do
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

  root to: 'home#index'
end
