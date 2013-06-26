Homespree::Application.routes.draw do

  # Root route must be before ActiveAdmin.routes(self)
  root :to => 'static_pages#home'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :mailinglists, only: [:create, :update, :destroy]

  # User routes: (Contractors and Homeowners) ---------------------------------------------------------------------
  get "sign_up" => "users/registrations#new"

  get "notifications" => "users/dashboard#notifications"
  get "general_settings" => "users/dashboard#general_settings"
  get "inbox" => "users/dashboard#inbox"
  get "my_projects" => "users/dashboard#my_projects"
  get "my_income" => "users/dashboard#my_income"
  get "material_calculator" => "users/dashboard#material_calculator"

  devise_scope :users do
    get "sign_up", to: "users/registrations#new"
    post "sign_up", to: "users/registrations#create"

    resources :sessions, module: :users
    resources :passwords, module: :users
  end

  # Homeowners: -----------------------------------------------------------------------------------------------------
  devise_for :homeowners, :controllers => {
    registrations: "homeowners/registrations",
    sessions: "homeowners/sessions",
    passwords: "homeowners/passwords"
  }

  resources :project_wizard

  resources :homeowners do
    resource :address, only: [:update]
    resources :photos, only: [:create, :update, :destroy]
    resources :appointments

    collection do
      resources :projects
    end
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

    resources :conversations, only: [:index, :show, :new, :create] do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end

    resource :address, only: [:update]
    resources :photos, only: [:create, :update, :destroy]
    resources :appointments
    resources :alerts
    resources :projects
  end

  # Gallery Browsing: ------------------------------------------------------------------------------------------------
  get "browse/contractors"
  get "browse/inspire"

  # Static Pages: ----------------------------------------------------------------------------------------------------
  %w(pitch home faqs about contact jobs how_it_works team for_professionals privacy_policy consumer_terms contractor_terms).each do |page|
    get page, controller: :static_pages, action: page
  end

end