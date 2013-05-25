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

  resources :contractors, only: [] do
    resources :specialties
    resource :address
  end

  resources :profiles, except: [:destroy], path: "contractors/profiles", module: "contractors", as: "contractor" do
    put "ignore_message"
    match "add_specialty" => "profiles#add_specialty"
    match "add_photo" => "profiles#add_photo"
  end

  resource :address

  resources :photos, except: [:edit, :delete]

  resources :mailinglists

  # Static pages page
  match 'pitch' => 'static_pages#pitch', as: "pitch"
  match 'home' => 'static_pages#home', as: "home"
  match 'contractors_preview' => 'static_pages#contractors', as: "contractors_preview"
  match 'homeowners_preview' => 'static_pages#homeowners', as: "homeowners_preview"
  match 'about' => 'static_pages#about'
  match 'contact' => 'static_pages#contact'
  match 'jobs' => 'static_pages#jobs'
  match 'test_ajax' => 'static_pages#test_ajax'
  match 'test_theme' => 'static_pages#test_theme'

end