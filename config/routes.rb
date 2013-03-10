Homespree::Application.routes.draw do

  devise_for :contractors
  devise_for :admin_users, ActiveAdmin::Devise.config


  resources :appointments
  resources :contractors, only: [:show, :index]
  resources :contractor_wizard

  match 'pitch' => 'pages#pitch', as: "pitch"

  ActiveAdmin.routes(self)

  resources :mailinglists

  # Static pages page
  match 'home'        => 'pages#home',        as: "home"
  match 'contractors_preview' => 'pages#contractors', as: "contractors_preview"
  match 'homeowners_preview'  => 'pages#homeowners',  as: "homeowners_preview"
  match 'about'       => 'pages#about'
  match 'contact'     => 'pages#contact'
  match 'jobs'        => 'pages#jobs'

  root :to => 'pages#home', :id => 'home'

end
