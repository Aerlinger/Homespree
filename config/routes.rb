Homespree::Application.routes.draw do

  devise_for :contractors

  resources :appointments
  resources :addresses
  resources :contractors

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :mailinglists

  # Static pages page
  match 'home'        => 'pages#home',        as: "home"
  match 'contractors' => 'pages#contractors', as: "contractors"
  match 'homeowners'  => 'pages#homeowners',  as: "homeowners"
  match 'about'       => 'pages#about',       as: "about"
  match 'contact'     => 'pages#contact',     as: "contact"
  match 'jobs'        => 'pages#jobs',        as: "jobs"

  root :to => 'pages#home', :id => 'home'

end
