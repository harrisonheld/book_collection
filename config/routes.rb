Rails.application.routes.draw do
  resources :user_books
  resources :users
  resources :books do
    get 'delete', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user_books#index"
end
