Rails.application.routes.draw do

  devise_for :users

  resources :entries
  resources :categories, param: :name
  root 'entries#index'

end
