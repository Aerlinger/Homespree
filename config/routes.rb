Homespree::Application.routes.draw do

  resources :jobs

  # Root route must be before ActiveAdmin.routes(self)
  root :to => 'static_pages#home'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :mailinglists, only: [:create, :update, :destroy]

  # Homeowners: -----------------------------------------------------------------------------------------------------
  devise_for :homeowners, :controllers => {
    registrations: "homeowners/registrations",
    sessions: "homeowners/sessions",
    passwords: "homeowners/passwords"
  }

  resources :homeowners do
    resource :address, only: [:update]
    resources :photos, only: [:create, :update, :destroy]
    resources :appointments
    resources :jobs
  end

  # Contractors: -----------------------------------------------------------------------------------------------------
  devise_for :contractors, :controllers => {
    registrations: "contractors/registrations",
    sessions: "contractors/sessions",
    passwords: "contractors/passwords"
  }

  resources :contractors do
    resources :specialties, only: [:create, :update, :destroy] do
      post :sort, on: :collection
    end
    resource :address, only: [:update]
    resources :photos, only: [:create, :update, :destroy]
    resources :appointments
    resources :jobs
  end

  # Gallery Browsing: ------------------------------------------------------------------------------------------------
  get "browse/contractors"
  get "browse/inspire"

  # Static Pages: ----------------------------------------------------------------------------------------------------
  %w(pitch home contractors_preview faqs about contact jobs).each do |page|
    get page, controller: :static_pages, action: page
  end

end