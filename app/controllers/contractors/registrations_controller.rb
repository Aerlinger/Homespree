class Contractors::RegistrationsController < Devise::RegistrationsController
  layout "login_page"

  after_filter :geolocate, only: [:create]
  #after_filter :send_welcome_email, :send_notification_email, only: [:create]

  def new
    super
    @contractor = Contractor.new({ email: params[:email] })
  end

  protected

  def after_sign_up_path_for(resource)
    contractor_path id: resource.slug
  end

  def send_welcome_email
    ContractorMailer.signup(resource).deliver
  end

  def send_notification_email
    %w[anthony].each do |admin|
      ContractorMailer.notify_signup(resource, admin).deliver
    end
  end

  def geolocate
    location = request.location
    resource.create_address! do |address|
      address.city      = location.city.presence || "New York"
      address.state     = location.state.presence || "NY"
      address.zipcode   = location.postal_code.presence || 10027
      address.latitude  = location.latitude.presence || -33.9417
      address.longitude = location.longitude.presence || 150.9473
    end
  end
end