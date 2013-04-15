Homespree::Application.routes.draw do

  get "users/new"

  get "users/create"

  get "users/edit"

  get "users/update"

  get "users/show"

  get "users/destroy"

  get "users/index"

  # Root route must be before ActiveAdmin.routes(self)
  root :to => 'static_pages#home'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config


  devise_for :contractors, :controllers => { registrations: "contractors/registrations", sessions: "contractors/sessions", passwords: "contractors/passwords" } do
  end

  namespace :contractors do
    resources :profiles, only: [:show, :index] do

    end
  end

  scope "/mailinglist", as: :mailinglist do
    match "create" => "mailinglists#create", via: :post
    match "unsubscribe/:email" => "mailinglists#unsubscribe", via: :get
    match "destroy/:email" => "mailinglists#destroy", via: :delete
  end

  # Static pages page
  match 'pitch' => 'static_pages#pitch', as: "pitch"
  match 'home'        => 'static_pages#home',        as: "home"
  match 'contractors_preview' => 'static_pages#contractors', as: "contractors_preview"
  match 'homeowners_preview'  => 'static_pages#homeowners',  as: "homeowners_preview"
  match 'about'       => 'static_pages#about'
  match 'contact'     => 'static_pages#contact'
  match 'jobs'        => 'static_pages#jobs'
  match 'test_theme'        => 'static_pages#test_theme'

end