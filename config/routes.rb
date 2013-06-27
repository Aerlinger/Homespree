Homespree::Application.routes.draw do

  # Root route must be before ActiveAdmin.routes(self)
  root :to => 'static_pages#home'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :mailinglists, only: [:create, :update, :destroy]

  # User routes: (Contractors and Homeowners) ---------------------------------------------------------------------
  scope :dashboard do
    get "notifications" => "users/dashboard#notifications"
    get "general_settings" => "users/dashboard#general_settings"
    get "inbox" => "users/dashboard#inbox"
    get "my_projects" => "users/dashboard#my_projects"
    get "my_income" => "users/dashboard#my_income"
    get "material_calculator" => "users/dashboard#material_calculator"
  end

  devise_for :users, :controllers => {
    #registrations: "users/registrations",
    sessions:      "users/sessions",
    passwords:     "users/passwords"
  }

  # Homeowners: -----------------------------------------------------------------------------------------------------
  resources :project_wizard

  devise_for :homeowners, :controllers => { registrations: "homeowners/registrations" }

  resources :homeowners, only: [:show, :update] do

    collection do
      resource :address, only: [:update]
      resources :photos, only: [:create, :update, :destroy]
      resources :appointments
      resources :projects
    end
  end

  # Contractors: -----------------------------------------------------------------------------------------------------
  devise_for :contractors, :controllers => { registrations: "contractors/registrations" }

  resources :contractors, only: [:show, :update] do

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

    collection do
      resource :address, only: [:update]
      resources :photos, only: [:create, :update, :destroy]
      resources :appointments, only: [:create, :update, :destroy, :show]
      resources :alerts, only: [:create, :destroy]
      resources :projects
    end
  end

  # Gallery Browsing: ------------------------------------------------------------------------------------------------
  get "browse/contractors"
  get "browse/inspire"

  # Static Pages: ----------------------------------------------------------------------------------------------------
  %w(pitch home faqs about contact jobs how_it_works team for_professionals privacy_policy consumer_terms contractor_terms).each do |page|
    get page, controller: :static_pages, action: page
  end

end