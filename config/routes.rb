Homespree::Application.routes.draw do

  # Root route must be before ActiveAdmin.routes(self)
  root :to => 'static_pages#home'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :mailinglists, only: [:create, :update, :destroy]

  # Users (Both Contractors and Homeowners): ------------------------------------------------------------------------
  scope :users do
    resources :conversations, only: [:index, :show, :new, :create] do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end
  end

  # Homeowners: -----------------------------------------------------------------------------------------------------
  devise_for :homeowners, :controllers => {
    registrations: "homeowners/registrations",
    sessions: "homeowners/sessions",
    passwords: "homeowners/passwords"
  }

  resources :job_submissions
  resources :jobs

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

    match 'material_calculator' => 'contractors#material_calculator', on: :member
  end

  # Gallery Browsing: ------------------------------------------------------------------------------------------------
  get "browse/contractors"
  get "browse/inspire"

  # Static Pages: ----------------------------------------------------------------------------------------------------


  %w(pitch home faqs about contact jobs how_it_works team for_professionals).each do |page|
    get page, controller: :static_pages, action: page
  end

end