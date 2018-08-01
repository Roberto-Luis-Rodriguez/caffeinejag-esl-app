Rails.application.routes.draw do
  root 'static_pages#home'
  get '/sign_in', to: 'static_pages#sign_in'
  get '/sign_up', to: 'teachers#new'
  # get '/sign_up', to: 'static_pages#sign_up'
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
