class Contractors::RegistrationsController < Users::RegistrationsController
  after_filter :geolocate, only: [:create]

  def new
    super
    @contractor = Contractor.new({ email: params[:email] })
  end

  protected

  def after_sign_up_path_for(resource)
    contractor_path id: resource.slug
  end

  def after_sign_up_fails_path_for(resource)
    new_contractor_registration_path
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