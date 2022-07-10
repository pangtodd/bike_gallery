Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  root to: 'bikes#home'
  resources :bikes do
    resources :reviews
  end
end