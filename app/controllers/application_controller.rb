class ApplicationController < ActionController::Base
  protect_from_forgery

  # Intercepts User-Agent for mobile routing
  include Mobylette::RespondToMobileRequests

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