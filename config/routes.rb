Rails.application.routes.draw do
  root  'static_pages#home'
  match "home",   to: 'static_pages#home',     via: [:get, :post]
  match "contact",to: 'static_pages#contact',  via: [:get, :post]
  match "signup", to: 'authentication#signup', via: [:get, :post]
  match "login",  to: 'authentication#login',  via: [:get, :post]
  match "signed_up",  to: 'authentication#signed_up',  via: [:get, :post]
  match "logged_in",  to: 'authentication#logged_in',  via: [:get, :post]
  get   "logout", to: 'authentication#logout'
end
