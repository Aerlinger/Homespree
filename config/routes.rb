Homespree::Application.routes.draw do

  # Root route must be before ActiveAdmin.routes(self)
  root :to => 'static_pages#home'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :mailinglists, only: [:create, :update, :destroy]

  # Homeowners: -----------------------------------------------------------------------------------------------------
  resources :project_wizard

  devise_for :homeowners, :controllers => {
    registrations: "homeowners/registrations",
    passwords:     "homeowners/passwords"
  },         skip:                     :sessions

  resources :homeowners, only: [:show, :update] do
    collection do
      resource :address, only: [:update]
      resources :photos, only: [:create, :update, :destroy]
      resources :appointments
      resources :projects
      resources :payments
    end
  end

  # Contractors: -----------------------------------------------------------------------------------------------------
  devise_for :contractors, :controllers => {
    registrations: "contractors/registrations",
    passwords:     "contractors/passwords"
  },         skip:                      :sessions

  resources :contractors, only: [:show, :update] do
    resources :specialties, only: [:create, :update, :destroy] do
      post :sort, on: :collection
    end

    get :map, on: :collection


    resources :messages
    resources :browse
    resources :conversations, only: [:index, :show, :new, :create] do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end

    resource :address, only: [:update]
    resources :photos, only: [:create, :update, :destroy]
    resources :appointments, only: [:create, :update, :destroy, :show]
    resources :alerts, only: [:create, :destroy]
    resources :projects
  end

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
    sessions: "users/sessions"
  },         skip:                :registrations

  namespace :users do
    resources :messages, except: [:update, :destroy]
    resources :conversations, only: [:index, :show, :update, :destroy]
  end

  # Gallery Browsing: ------------------------------------------------------------------------------------------------
  get "browse/contractors"
  get "browse/inspire"

  # Static Pages: ----------------------------------------------------------------------------------------------------
  %w(pitch home faqs about contact jobs how_it_works team for_professionals privacy_policy consumer_terms contractor_terms).each do |page|
    get page, controller: :static_pages, action: page
  end
end
#== Route Map
# Generated on 30 Jun 2013 20:08
#
#                              root        /                                                               static_pages#home
#                        admin_root        /admin(.:format)                                                admin/dashboard#index
#                              root        /                                                               dashboard#index
#      batch_action_admin_addresses POST   /admin/addresses/batch_action(.:format)                         admin/addresses#batch_action
#                   admin_addresses GET    /admin/addresses(.:format)                                      admin/addresses#index
#                                   POST   /admin/addresses(.:format)                                      admin/addresses#create
#                 new_admin_address GET    /admin/addresses/new(.:format)                                  admin/addresses#new
#                edit_admin_address GET    /admin/addresses/:id/edit(.:format)                             admin/addresses#edit
#                     admin_address GET    /admin/addresses/:id(.:format)                                  admin/addresses#show
#                                   PUT    /admin/addresses/:id(.:format)                                  admin/addresses#update
#                                   DELETE /admin/addresses/:id(.:format)                                  admin/addresses#destroy
#   batch_action_admin_appointments POST   /admin/appointments/batch_action(.:format)                      admin/appointments#batch_action
#                admin_appointments GET    /admin/appointments(.:format)                                   admin/appointments#index
#                                   POST   /admin/appointments(.:format)                                   admin/appointments#create
#             new_admin_appointment GET    /admin/appointments/new(.:format)                               admin/appointments#new
#            edit_admin_appointment GET    /admin/appointments/:id/edit(.:format)                          admin/appointments#edit
#                 admin_appointment GET    /admin/appointments/:id(.:format)                               admin/appointments#show
#                                   PUT    /admin/appointments/:id(.:format)                               admin/appointments#update
#                                   DELETE /admin/appointments/:id(.:format)                               admin/appointments#destroy
#    batch_action_admin_contractors POST   /admin/contractors/batch_action(.:format)                       admin/contractors#batch_action
#                 admin_contractors GET    /admin/contractors(.:format)                                    admin/contractors#index
#                                   POST   /admin/contractors(.:format)                                    admin/contractors#create
#              new_admin_contractor GET    /admin/contractors/new(.:format)                                admin/contractors#new
#             edit_admin_contractor GET    /admin/contractors/:id/edit(.:format)                           admin/contractors#edit
#                  admin_contractor GET    /admin/contractors/:id(.:format)                                admin/contractors#show
#                                   PUT    /admin/contractors/:id(.:format)                                admin/contractors#update
#                                   DELETE /admin/contractors/:id(.:format)                                admin/contractors#destroy
#                   admin_dashboard        /admin/dashboard(.:format)                                      admin/dashboard#index
#     batch_action_admin_homeowners POST   /admin/homeowners/batch_action(.:format)                        admin/homeowners#batch_action
#                  admin_homeowners GET    /admin/homeowners(.:format)                                     admin/homeowners#index
#                                   POST   /admin/homeowners(.:format)                                     admin/homeowners#create
#               new_admin_homeowner GET    /admin/homeowners/new(.:format)                                 admin/homeowners#new
#              edit_admin_homeowner GET    /admin/homeowners/:id/edit(.:format)                            admin/homeowners#edit
#                   admin_homeowner GET    /admin/homeowners/:id(.:format)                                 admin/homeowners#show
#                                   PUT    /admin/homeowners/:id(.:format)                                 admin/homeowners#update
#                                   DELETE /admin/homeowners/:id(.:format)                                 admin/homeowners#destroy
#   batch_action_admin_mailinglists POST   /admin/mailinglists/batch_action(.:format)                      admin/mailinglists#batch_action
#                admin_mailinglists GET    /admin/mailinglists(.:format)                                   admin/mailinglists#index
#                                   POST   /admin/mailinglists(.:format)                                   admin/mailinglists#create
#             new_admin_mailinglist GET    /admin/mailinglists/new(.:format)                               admin/mailinglists#new
#            edit_admin_mailinglist GET    /admin/mailinglists/:id/edit(.:format)                          admin/mailinglists#edit
#                 admin_mailinglist GET    /admin/mailinglists/:id(.:format)                               admin/mailinglists#show
#                                   PUT    /admin/mailinglists/:id(.:format)                               admin/mailinglists#update
#                                   DELETE /admin/mailinglists/:id(.:format)                               admin/mailinglists#destroy
# batch_action_admin_project_fields POST   /admin/project_fields/batch_action(.:format)                    admin/project_fields#batch_action
#              admin_project_fields GET    /admin/project_fields(.:format)                                 admin/project_fields#index
#                                   POST   /admin/project_fields(.:format)                                 admin/project_fields#create
#           new_admin_project_field GET    /admin/project_fields/new(.:format)                             admin/project_fields#new
#          edit_admin_project_field GET    /admin/project_fields/:id/edit(.:format)                        admin/project_fields#edit
#               admin_project_field GET    /admin/project_fields/:id(.:format)                             admin/project_fields#show
#                                   PUT    /admin/project_fields/:id(.:format)                             admin/project_fields#update
#                                   DELETE /admin/project_fields/:id(.:format)                             admin/project_fields#destroy
#  batch_action_admin_project_types POST   /admin/project_types/batch_action(.:format)                     admin/project_types#batch_action
#               admin_project_types GET    /admin/project_types(.:format)                                  admin/project_types#index
#                                   POST   /admin/project_types(.:format)                                  admin/project_types#create
#            new_admin_project_type GET    /admin/project_types/new(.:format)                              admin/project_types#new
#           edit_admin_project_type GET    /admin/project_types/:id/edit(.:format)                         admin/project_types#edit
#                admin_project_type GET    /admin/project_types/:id(.:format)                              admin/project_types#show
#                                   PUT    /admin/project_types/:id(.:format)                              admin/project_types#update
#                                   DELETE /admin/project_types/:id(.:format)                              admin/project_types#destroy
#       batch_action_admin_projects POST   /admin/projects/batch_action(.:format)                          admin/projects#batch_action
#                    admin_projects GET    /admin/projects(.:format)                                       admin/projects#index
#                                   POST   /admin/projects(.:format)                                       admin/projects#create
#                 new_admin_project GET    /admin/projects/new(.:format)                                   admin/projects#new
#                edit_admin_project GET    /admin/projects/:id/edit(.:format)                              admin/projects#edit
#                     admin_project GET    /admin/projects/:id(.:format)                                   admin/projects#show
#                                   PUT    /admin/projects/:id(.:format)                                   admin/projects#update
#                                   DELETE /admin/projects/:id(.:format)                                   admin/projects#destroy
#  batch_action_admin_service_types POST   /admin/service_types/batch_action(.:format)                     admin/service_types#batch_action
#               admin_service_types GET    /admin/service_types(.:format)                                  admin/service_types#index
#                                   POST   /admin/service_types(.:format)                                  admin/service_types#create
#            new_admin_service_type GET    /admin/service_types/new(.:format)                              admin/service_types#new
#           edit_admin_service_type GET    /admin/service_types/:id/edit(.:format)                         admin/service_types#edit
#                admin_service_type GET    /admin/service_types/:id(.:format)                              admin/service_types#show
#                                   PUT    /admin/service_types/:id(.:format)                              admin/service_types#update
#                                   DELETE /admin/service_types/:id(.:format)                              admin/service_types#destroy
#       batch_action_admin_comments POST   /admin/comments/batch_action(.:format)                          admin/comments#batch_action
#                    admin_comments GET    /admin/comments(.:format)                                       admin/comments#index
#                                   POST   /admin/comments(.:format)                                       admin/comments#create
#                     admin_comment GET    /admin/comments/:id(.:format)                                   admin/comments#show
#             batch_action_comments POST   /comments/batch_action(.:format)                                comments#batch_action
#                          comments GET    /comments(.:format)                                             comments#index
#                                   POST   /comments(.:format)                                             comments#create
#                           comment GET    /comments/:id(.:format)                                         comments#show
#            new_admin_user_session GET    /admin/login(.:format)                                          active_admin/devise/sessions#new
#                admin_user_session POST   /admin/login(.:format)                                          active_admin/devise/sessions#create
#        destroy_admin_user_session GET    /admin/logout(.:format)                                         active_admin/devise/sessions#destroy
#               admin_user_password POST   /admin/password(.:format)                                       active_admin/devise/passwords#create
#           new_admin_user_password GET    /admin/password/new(.:format)                                   active_admin/devise/passwords#new
#          edit_admin_user_password GET    /admin/password/edit(.:format)                                  active_admin/devise/passwords#edit
#                                   PUT    /admin/password(.:format)                                       active_admin/devise/passwords#update
#                      mailinglists POST   /mailinglists(.:format)                                         mailinglists#create
#                       mailinglist PUT    /mailinglists/:id(.:format)                                     mailinglists#update
#                                   DELETE /mailinglists/:id(.:format)                                     mailinglists#destroy
#                     notifications GET    /notifications(.:format)                                        users/dashboard#notifications
#                  general_settings GET    /general_settings(.:format)                                     users/dashboard#general_settings
#                             inbox GET    /inbox(.:format)                                                users/dashboard#inbox
#                       my_projects GET    /my_projects(.:format)                                          users/dashboard#my_projects
#                         my_income GET    /my_income(.:format)                                            users/dashboard#my_income
#               material_calculator GET    /material_calculator(.:format)                                  users/dashboard#material_calculator
#                  new_user_session GET    /users/sign_in(.:format)                                        users/sessions#new
#                      user_session POST   /users/sign_in(.:format)                                        users/sessions#create
#              destroy_user_session GET    /users/sign_out(.:format)                                       users/sessions#destroy
#                     user_password POST   /users/password(.:format)                                       users/passwords#create
#                 new_user_password GET    /users/password/new(.:format)                                   users/passwords#new
#                edit_user_password GET    /users/password/edit(.:format)                                  users/passwords#edit
#                                   PUT    /users/password(.:format)                                       users/passwords#update
#          cancel_user_registration GET    /users/cancel(.:format)                                         users/registrations#cancel
#                 user_registration POST   /users(.:format)                                                users/registrations#create
#             new_user_registration GET    /users/sign_up(.:format)                                        users/registrations#new
#            edit_user_registration GET    /users/edit(.:format)                                           users/registrations#edit
#                                   PUT    /users(.:format)                                                users/registrations#update
#                                   DELETE /users(.:format)                                                users/registrations#destroy
#              project_wizard_index GET    /project_wizard(.:format)                                       project_wizard#index
#                                   POST   /project_wizard(.:format)                                       project_wizard#create
#                new_project_wizard GET    /project_wizard/new(.:format)                                   project_wizard#new
#               edit_project_wizard GET    /project_wizard/:id/edit(.:format)                              project_wizard#edit
#                    project_wizard GET    /project_wizard/:id(.:format)                                   project_wizard#show
#                                   PUT    /project_wizard/:id(.:format)                                   project_wizard#update
#                                   DELETE /project_wizard/:id(.:format)                                   project_wizard#destroy
#             new_homeowner_session GET    /homeowners/sign_in(.:format)                                   homeowners/sessions#new
#                 homeowner_session POST   /homeowners/sign_in(.:format)                                   homeowners/sessions#create
#         destroy_homeowner_session GET    /homeowners/sign_out(.:format)                                  homeowners/sessions#destroy
#                homeowner_password POST   /homeowners/password(.:format)                                  homeowners/passwords#create
#            new_homeowner_password GET    /homeowners/password/new(.:format)                              homeowners/passwords#new
#           edit_homeowner_password GET    /homeowners/password/edit(.:format)                             homeowners/passwords#edit
#                                   PUT    /homeowners/password(.:format)                                  homeowners/passwords#update
#     cancel_homeowner_registration GET    /homeowners/cancel(.:format)                                    homeowners/registrations#cancel
#            homeowner_registration POST   /homeowners(.:format)                                           homeowners/registrations#create
#        new_homeowner_registration GET    /homeowners/sign_up(.:format)                                   homeowners/registrations#new
#       edit_homeowner_registration GET    /homeowners/edit(.:format)                                      homeowners/registrations#edit
#                                   PUT    /homeowners(.:format)                                           homeowners/registrations#update
#                                   DELETE /homeowners(.:format)                                           homeowners/registrations#destroy
#                           address PUT    /homeowners/address(.:format)                                   addresses#update
#                            photos POST   /homeowners/photos(.:format)                                    photos#create
#                             photo PUT    /homeowners/photos/:id(.:format)                                photos#update
#                                   DELETE /homeowners/photos/:id(.:format)                                photos#destroy
#                      appointments GET    /homeowners/appointments(.:format)                              appointments#index
#                                   POST   /homeowners/appointments(.:format)                              appointments#create
#                   new_appointment GET    /homeowners/appointments/new(.:format)                          appointments#new
#                  edit_appointment GET    /homeowners/appointments/:id/edit(.:format)                     appointments#edit
#                       appointment GET    /homeowners/appointments/:id(.:format)                          appointments#show
#                                   PUT    /homeowners/appointments/:id(.:format)                          appointments#update
#                                   DELETE /homeowners/appointments/:id(.:format)                          appointments#destroy
#                          projects GET    /homeowners/projects(.:format)                                  projects#index
#                                   POST   /homeowners/projects(.:format)                                  projects#create
#                       new_project GET    /homeowners/projects/new(.:format)                              projects#new
#                      edit_project GET    /homeowners/projects/:id/edit(.:format)                         projects#edit
#                           project GET    /homeowners/projects/:id(.:format)                              projects#show
#                                   PUT    /homeowners/projects/:id(.:format)                              projects#update
#                                   DELETE /homeowners/projects/:id(.:format)                              projects#destroy
#                         homeowner GET    /homeowners/:id(.:format)                                       homeowners#show
#                                   PUT    /homeowners/:id(.:format)                                       homeowners#update
#            new_contractor_session GET    /contractors/sign_in(.:format)                                  contractors/sessions#new
#                contractor_session POST   /contractors/sign_in(.:format)                                  contractors/sessions#create
#        destroy_contractor_session GET    /contractors/sign_out(.:format)                                 contractors/sessions#destroy
#               contractor_password POST   /contractors/password(.:format)                                 contractors/passwords#create
#           new_contractor_password GET    /contractors/password/new(.:format)                             contractors/passwords#new
#          edit_contractor_password GET    /contractors/password/edit(.:format)                            contractors/passwords#edit
#                                   PUT    /contractors/password(.:format)                                 contractors/passwords#update
#    cancel_contractor_registration GET    /contractors/cancel(.:format)                                   contractors/registrations#cancel
#           contractor_registration POST   /contractors(.:format)                                          contractors/registrations#create
#       new_contractor_registration GET    /contractors/sign_up(.:format)                                  contractors/registrations#new
#      edit_contractor_registration GET    /contractors/edit(.:format)                                     contractors/registrations#edit
#                                   PUT    /contractors(.:format)                                          contractors/registrations#update
#                                   DELETE /contractors(.:format)                                          contractors/registrations#destroy
#       sort_contractor_specialties POST   /contractors/:contractor_id/specialties/sort(.:format)          specialties#sort
#            contractor_specialties POST   /contractors/:contractor_id/specialties(.:format)               specialties#create
#              contractor_specialty PUT    /contractors/:contractor_id/specialties/:id(.:format)           specialties#update
#                                   DELETE /contractors/:contractor_id/specialties/:id(.:format)           specialties#destroy
#     reply_contractor_conversation POST   /contractors/:contractor_id/conversations/:id/reply(.:format)   conversations#reply
#     trash_contractor_conversation POST   /contractors/:contractor_id/conversations/:id/trash(.:format)   conversations#trash
#   untrash_contractor_conversation POST   /contractors/:contractor_id/conversations/:id/untrash(.:format) conversations#untrash
#          contractor_conversations GET    /contractors/:contractor_id/conversations(.:format)             conversations#index
#                                   POST   /contractors/:contractor_id/conversations(.:format)             conversations#create
#       new_contractor_conversation GET    /contractors/:contractor_id/conversations/new(.:format)         conversations#new
#           contractor_conversation GET    /contractors/:contractor_id/conversations/:id(.:format)         conversations#show
#                contractor_address PUT    /contractors/:contractor_id/address(.:format)                   addresses#update
#                 contractor_photos POST   /contractors/:contractor_id/photos(.:format)                    photos#create
#                  contractor_photo PUT    /contractors/:contractor_id/photos/:id(.:format)                photos#update
#                                   DELETE /contractors/:contractor_id/photos/:id(.:format)                photos#destroy
#           contractor_appointments POST   /contractors/:contractor_id/appointments(.:format)              appointments#create
#            contractor_appointment GET    /contractors/:contractor_id/appointments/:id(.:format)          appointments#show
#                                   PUT    /contractors/:contractor_id/appointments/:id(.:format)          appointments#update
#                                   DELETE /contractors/:contractor_id/appointments/:id(.:format)          appointments#destroy
#                 contractor_alerts POST   /contractors/:contractor_id/alerts(.:format)                    alerts#create
#                  contractor_alert DELETE /contractors/:contractor_id/alerts/:id(.:format)                alerts#destroy
#               contractor_projects GET    /contractors/:contractor_id/projects(.:format)                  projects#index
#                                   POST   /contractors/:contractor_id/projects(.:format)                  projects#create
#            new_contractor_project GET    /contractors/:contractor_id/projects/new(.:format)              projects#new
#           edit_contractor_project GET    /contractors/:contractor_id/projects/:id/edit(.:format)         projects#edit
#                contractor_project GET    /contractors/:contractor_id/projects/:id(.:format)              projects#show
#                                   PUT    /contractors/:contractor_id/projects/:id(.:format)              projects#update
#                                   DELETE /contractors/:contractor_id/projects/:id(.:format)              projects#destroy
#                        contractor GET    /contractors/:id(.:format)                                      contractors#show
#                                   PUT    /contractors/:id(.:format)                                      contractors#update
#                browse_contractors GET    /browse/contractors(.:format)                                   browse#contractors
#                    browse_inspire GET    /browse/inspire(.:format)                                       browse#inspire
#                             pitch GET    /pitch(.:format)                                                static_pages#pitch
#                              home GET    /home(.:format)                                                 static_pages#home
#                              faqs GET    /faqs(.:format)                                                 static_pages#faqs
#                             about GET    /about(.:format)                                                static_pages#about
#                           contact GET    /contact(.:format)                                              static_pages#contact
#                              jobs GET    /jobs(.:format)                                                 static_pages#jobs
#                      how_it_works GET    /how_it_works(.:format)                                         static_pages#how_it_works
#                              team GET    /team(.:format)                                                 static_pages#team
#                 for_professionals GET    /for_professionals(.:format)                                    static_pages#for_professionals
#                    privacy_policy GET    /privacy_policy(.:format)                                       static_pages#privacy_policy
#                    consumer_terms GET    /consumer_terms(.:format)                                       static_pages#consumer_terms
#                  contractor_terms GET    /contractor_terms(.:format)                                     static_pages#contractor_terms
