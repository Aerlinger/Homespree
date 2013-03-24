class ApplicationController < ActionController::Base
  protect_from_forgery
  include Mobylette::RespondToMobileRequests

  mobylette_config do |config|
    config[:skip_user_agents] = [:ipad, :kindle]
    config[:mobile_user_agents] = proc { %r{iphone|mobile|blackberry|nokia|palm|opera mini|windows ce}i }
  end

  # Devise Helpers:

  # contractor_signed_in?
  # contractor_session
  # current_contractor
  # authenticate_contractor!
  # after_sign_in_path_for(resource)
  # after_sign_out_path_for(resource)
  # after_update_path_for(resource)

  # devise_error_messages!

  private

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end

end
