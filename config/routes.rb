Homespree::Application.routes.draw do

  # Root route must be before ActiveAdmin.routes(self)
  root :to => 'static_pages#home'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config


  devise_for :contractors, :controllers => {
    registrations: "contractors/registrations",
    sessions: "contractors/sessions",
    passwords: "contractors/passwords"
  }

  resources :contractors do
    resources :specialties do
      post :sort, on: :collection
    end
    resource :address, only: [:update]
    resources :photos, only: [:create, :update, :destroy]
  end

  resources :mailinglists, only: [:create, :update, :destroy]

  get "browse/contractors"
  get "browse/inspire"

  # Static pages page
  match 'pitch' => 'static_pages#pitch', as: "pitch"
  match 'home' => 'static_pages#home', as: "home"
  match 'contractors_preview' => 'static_pages#contractors', as: "contractors_preview"
  match 'faqs' => 'static_pages#faqs'
  match 'about' => 'static_pages#about'
  match 'contact' => 'static_pages#contact'
  match 'jobs' => 'static_pages#jobs'

end