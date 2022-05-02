Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = "localhost:3000"
  resources :statuses
  resources :books do
    resources :book_statuses, except: :index
  end
  resources :book_statuses, only: :index
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # resources :users # must be after devise routes declaration
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
