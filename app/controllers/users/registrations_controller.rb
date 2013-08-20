class Users::RegistrationsController < Devise::RegistrationsController
  layout "login_page"

  after_filter :geolocate, only: :create

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