## Devise Helpers:
#
# contractor_signed_in?
# contractor_session
# current_contractor
# authenticate_contractor!
# after_sign_in_path_for(resource)
# after_sign_out_path_for(resource)
# after_update_path_for(resource)
# devise_error_messages!
#
class ApplicationController < ActionController::Base
  protect_from_forgery

  ## Uncomment to enable Mobile routing:
  include Mobylette::RespondToMobileRequests
  # mobylette_config do |config|
  #   config[:skip_user_agents] = [:ipad, :kindle]
  #   config[:mobile_user_agents] = proc { %r{iphone|mobile|blackberry|nokia|palm|opera mini|windows ce}i }
  # end


  # Returns:
  # contractor if a contractor is signed in
  # homeowner if a homeowner is signed in
  # guest_homeowner if a homeowner guest is signed in
  # nil if none of the above
  #def current_user
  #  if contractor_signed_in?
  #    current_contractor
  #  elsif homeowner_signed_in?
  #    if session[:guest_homeowner_id]
  #      # TODO: Upgrade guest_homeowner to homeowner and destroy session
  #      # Example:
  #      # logging_in
  #      # guest_homeowner.destroy
  #      # session[:guest_user_id] = nil
  #    end
  #    current_homeowner
  #  else
  #    guest_homeowner
  #  end
  #end

  def signed_in_user
    user = current_user
    user.klass.find(user.id)
  end

  def current_user
    current_homeowner || guest_homeowner || current_contractor
  end

  def user_signed_in?
    !current_user.nil?
  end


  def guest_homeowner
    # Cache the value:
    @cached_guest_user ||= Homeowner.find(session[:guest_homeowner_id] ||= create_guest_homeowner.id)
  rescue ActiveRecord::RecordNotFound # If session[:guest_homeowner_id] invalid
    session[:guest_homeowner_id] = nil
    #guest_homeowner
  end

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :signed_in_user

  private

  # Passes off code from guest_homeowner when the homeowner
  # fully signs in.
  def convert_guest_to_homeowner
    # An example (Passing associations):
    # guest_projects = guest_homeowner.projects.all
    # guest_projects.each do |project|
    #   project.homeowner_id = current_user.id
    #   project.save!
    # end
  end

  def create_guest_homeowner
    guest_homeowner = Homeowner.create_guest
    session[:guest_homeowner_id] = guest_homeowner.id
    return guest_homeowner
  end

  def user_class
    current_user.klass if current_user.present?
  end

end