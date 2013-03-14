Homespree::Application.routes.draw do

  root :to => 'static_pages#home', :id => 'home'
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :contractors, :controllers =>
      { registrations: "contractors/registrations", sessions: "contractors/sessions" }

  namespace :contractors do
    resources :wizard
    resources :profiles, only: [:show, :index]
  end

  resources :mailinglists, only: [:create]


  # Static pages page
  match 'pitch' => 'static_pages#pitch', as: "pitch"
  match 'home'        => 'static_pages#home',        as: "home"
  match 'contractors_preview' => 'static_pages#contractors', as: "contractors_preview"
  match 'homeowners_preview'  => 'static_pages#homeowners',  as: "homeowners_preview"
  match 'about'       => 'static_pages#about'
  match 'contact'     => 'static_pages#contact'
  match 'jobs'        => 'static_pages#jobs'

end