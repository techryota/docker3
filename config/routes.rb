Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:edit, :update, :show] do
    resources :good_evaluations, only: [:new, :create]
  end
  resources :groups, only: [:index, :new, :create, :show, :edit, :update] do
    resources :messages, only: [:index, :new, :create]
    resources :counts, only: [:index, :create]
    resources :scores, only: [:index, :create]
  end
end