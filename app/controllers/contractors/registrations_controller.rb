class Contractors::RegistrationsController < Devise::RegistrationsController

  layout "login_page", only: [:new, :edit]

  respond_to :html, :json

  before_filter :mobylette_devise_hack, only: :create

  mobylette_config do |config|
    config[:fallback_chains] = { mobile: [:html, :haml] }
  end

  def mobylette_devise_hack
    session[:mobylette_override] = :ignore_mobile
  end

  after_filter :geolocate, only: [:create]

  def new
    super
    @contractor = Contractor.new({ email: params[:email] })
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
    contractor_path id: resource.slug
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