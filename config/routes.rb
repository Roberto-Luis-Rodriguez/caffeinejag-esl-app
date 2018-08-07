Rails.application.routes.draw do
  root 'static_pages#home'
  get '/sign_in', to: 'static_pages#sign_in'
  get '/sign_up', to: 'teachers#new'
  post '/sign_up',  to: 'teachers#create'
  resources :teachers
end

# Rails.application.routes.draw do
  # get 'teachers/new'

#
#   root 'static_pages#home'
#
#   get 'static_pages/home'
#
#   get 'static_pages/sign_in'
#
#   get 'static_pages/sign_up'
#
# end
