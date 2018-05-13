Rails.application.routes.draw do
  get 'reporter/doctor_by_appointment'

  resources :users
  resources :content_images
  resources :customized_contents
  resources :appointments
  resources :contacts
  resources :dentists
  resources :patients
  resources :administrators

  root "customized_contents#show_format_content"
  get "content" => "customized_contents#content"
  get "login" => "login#index"
  get "appointment_by_dentist" => "reporter#appointment_by_dentist"
  get "appointment_by_patient" => "reporter#appointment_by_patient"

  post "search_appointment_by_dentist" => "reporter#search_appointment_by_dentist"
  post "search_appointment_by_patient" => "reporter#search_appointment_by_patient"

  post "authenticate" => "login#authenticate"
  get "logout" => "login#logout"
  get "show_form_for_user" => "contacts#form_for_user"
  post "search_appointments" => "search_appointments#search_appointments"
  get "show_format_content/:id" => "customized_contents#show_format_content"
  #get "show_format_content" => "customized_contents#show_format_content"
  post "upload_image" =>  "content_images#upload_image"
  get "download_image/:id"  =>  "content_images#download_image"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
