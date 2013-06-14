class Contractors::RegistrationsController < Devise::RegistrationsController

  respond_to :html, :json

  after_filter :geolocate, only: [:create]

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
    resource.create_address do |address|
      city = request.location.city || "New York"
      zipcode = request.location.postal_code || 10027
      latitude = request.location.latitude || -33.9417
      longitude = request.location.longitude || 150.9473
    end
    resource.save!
  end

end