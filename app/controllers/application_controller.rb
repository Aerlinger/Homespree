class ApplicationController < ActionController::Base
  protect_from_forgery


  # Intercepts User-Agent for mobile routing
  # Note: -- This is disabled due to a conflict with Devise and MIME types.
  # This is temporary until a more elegant solution is found.
  #include Mobylette::RespondToMobileRequests


  # -----------------------------------------------------------------------------------------------------
  # Note: I am bypassing Devise's dynamic finder here and directly interacting with the
  #       session object established by Warden. Devise's dynamic methods use +method_missing
  #       which isn't favorable in our case.
  # -----------------------------------------------------------------------------------------------------
  def guest_homeowner
    # Cache the value:
    @cached_guest_user ||= Homeowner.find(session[:guest_homeowner_id])
  rescue ActiveRecord::RecordNotFound # If session[:guest_homeowner_id] invalid
    # Returns nil if not found
    session[:guest_homeowner_id] = nil
  end

  def current_user
    if session["warden.user.user.key"]
      @current_user ||= User.find(session["warden.user.user.key"][0][0])
    elsif session["warden.user.contractor.key"]
      @current_user ||= User.find(session["warden.user.contractor.key"][0][0])
    elsif session["warden.user.homeowner.key"]
      @current_user ||= User.find(session["warden.user.homeowner.key"][0][0])
    else
      guest_homeowner
    end
  end

  def user_signed_in?
    current_user.present?
  end

  helper_method :current_user
  helper_method :guest_homeowner
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
    guest_homeowner              = Homeowner.create_guest
    session[:guest_homeowner_id] = guest_homeowner.id
    return guest_homeowner
  end
end