class ApplicationController < ActionController::Base
  protect_from_forgery

  # Devise Helpers:

  # contractor_signed_in
  # contractor_session
  # current_contractor
  # :authenticate_contractor!
end
