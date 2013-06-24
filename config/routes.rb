Homespree::Application.routes.draw do

  # Root route must be before ActiveAdmin.routes(self)
  root :to => 'static_pages#home'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :mailinglists, only: [:create, :update, :destroy]

  # Shared routes: (Contractors and Homeowners) ---------------------------------------------------------------------
  get "sign_up" => "users/registrations#new"

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

  get "notifications" => "contractors/dashboard#notifications"
  get "general_settings" => "contractors/dashboard#general_settings"
  get "inbox" => "contractors/dashboard#inbox"
  get "my_projects" => "contractors/dashboard#my_projects"
  get "my_income" => "contractors/dashboard#my_income"
  get "material_calculator" => "contractors/dashboard#material_calculator"

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
  %w(pitch home faqs about contact jobs how_it_works team for_professionals).each do |page|
    get page, controller: :static_pages, action: page
  end

end