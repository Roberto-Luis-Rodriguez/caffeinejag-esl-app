Rails.application.routes.draw do
  root 'static_pages#home'
  get '/sign_up', to: 'teachers#new'
  post '/sign_up',  to: 'teachers#create'
  get    '/sign_in',   to: 'sessions#new'
  post   '/sign_in',   to: 'sessions#create'
  delete '/sign_out',  to: 'sessions#destroy'
  resources :teachers
  resources :account_activations, only: [:edit]
end
