Homespree::Application.routes.draw do

  devise_for :contractors

  resources :appointments
  resources :addresses
  resources :contractors

  match 'pitch' => 'pages#pitch', as: "pitch"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :mailinglists

  # Static pages page
  match 'home'        => 'pages#home',        as: "home"
  match 'contractors_preview' => 'pages#contractors', as: "contractors_preview"
  match 'homeowners_preview'  => 'pages#homeowners',  as: "homeowners_preview"
  match 'about'       => 'pages#about'
  match 'contact'     => 'pages#contact'
  match 'jobs'        => 'pages#jobs'

  # Mobile

  #match 'm' => 'mobile_pages#home'

  root :to => 'pages#home', :id => 'home'

end
