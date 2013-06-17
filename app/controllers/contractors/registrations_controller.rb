class Contractors::RegistrationsController < Devise::RegistrationsController

  layout "static_page"
  respond_to :html, :json

  after_filter :geolocate, :add_badges, only: [:create]

  def new
    super
    @contractor = Contractor.new({email: params[:email]})
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
    redirect_to root_path
  end

  def cancel
    super
  end

  protected

  def after_sign_up_path_for(resource)
    contractor_path id: resource.id
  end

  def geolocate
    location = request.location
    resource.create_address! do |address|
      address.city = location.city.presence || "New York"
      address.state = location.state.presence || "New York"
      address.zipcode = location.postal_code.presence || 10027
      address.latitude = location.latitude.presence || -33.9417
      address.longitude = location.longitude.presence || 150.9473
    end
  end

  def add_badges
    resources.badges << Badge.create(name: "approved")
  end

end