Rails.application.routes.draw do

  authenticated do
    root to: 'entries#index', as: :authenticated
  end

  root 'home#index'
  get '/home' => 'home#index'
  devise_for :users

  resources :entries
  resources :categories, param: :name

  post "/scraper" => "scrapers#create"
end
