Rails.application.routes.draw do
  #devise_for :users
  # get '/home' => 'home#index'
  # get 'home/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }

  root 'home#index'

  resources :employees
  resources :documents

  get 'about' => 'pages#about_us'
  get 'contact' => 'pages#contact_us'
  get 'privacy-policy' => 'pages#privacy_policy'
  get 'terms-and-conditions' => 'pages#terms_and_conditions'

  # get 'pages/about_us'
  # get 'pages/contact_us'
  #get 'pages/privacy_policy'
  #get 'pages/terms_and_conditions'



end
