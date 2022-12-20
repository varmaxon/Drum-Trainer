Rails.application.routes.draw do
  devise_for :users
  post 'form', to: 'calc#result'
  get 'static_pages/landing_page'
  get 'dashboard', to: 'calc#input'
  # get 'static_pages/dashboard'
  root "static_pages#landing_page"
end
