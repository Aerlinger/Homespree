Homespree::Application.routes.draw do

  root :to => 'pages#home', :id => 'home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :contractors, :controllers =>
      { registrations: "contractors/registrations", sessions: "contractors/sessions" }

  namespace :contractors do
    resources :wizard
    resources :profiles, only: [:show, :index]
  end

  match 'pitch' => 'pages#pitch', as: "pitch"

  ActiveAdmin.routes(self)

  resources :mailinglists, only: [:create]

  # Static pages page
  match 'home'        => 'pages#home',        as: "home"
  match 'contractors_preview' => 'pages#contractors', as: "contractors_preview"
  match 'homeowners_preview'  => 'pages#homeowners',  as: "homeowners_preview"
  match 'about'       => 'pages#about'
  match 'contact'     => 'pages#contact'
  match 'jobs'        => 'pages#jobs'

end