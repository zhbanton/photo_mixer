Rails.application.routes.draw do

  get '/profile/:id', to: "profile#show", as: :profile

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :images, except: [:show] do
    resource :vote, only: :update, defaults: { votable_type: 'Image' }
    resources :comments, only: [:index, :create]
  end
  resources :comments, only: [:show] do
    resource :vote, only: :update, defaults: { votable_type: 'Comment' }
  end

  resources :favorites, only: [:create, :destroy]

  resources :categories, only: [:show]

  root to: 'home#index'
end
