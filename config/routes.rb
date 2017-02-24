Rails.application.routes.draw do
  root "static_pages#home"
  match 'signup', to: 'authentication#signup', via: [:get, :post]
  match "login",  to: 'authentication#login',  via: [:get, :post]
end
