require 'sidekiq/web'
Rails.application.routes.draw do
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'home#index'
  resources :books
  resources :authors
  get '/respon_json'  => 'books#respons_json'

end
