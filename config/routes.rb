Rails.application.routes.draw do
  resources :appointments
  resources :contacts
  resources :dentists
  resources :patients
  resources :administrators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
