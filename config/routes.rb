Rails.application.routes.draw do
  root "static_pages#home"
  match 'signup', to: 'authentication#signup', via: [:get, :post]
  match "login",  to: 'authentication#login',  via: [:get, :post]
  match 'contact',to: 'static_pages#contact',  via: [:get, :post]
  match "home",   to: 'static_pages#home',     via: [:get, :post]
end
