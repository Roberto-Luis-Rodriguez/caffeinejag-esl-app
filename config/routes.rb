Rails.application.routes.draw do

  root 'static_pages#home'

  get 'static_pages/home'

  get 'static_pages/sign_in'

  get 'static_pages/sign_up'

end
