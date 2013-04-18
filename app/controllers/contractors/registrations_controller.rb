class Contractors::RegistrationsController < Devise::RegistrationsController

  layout "registration"

  def new
    super
    @contactor = Contractor.new
    @contractor.addresses.build
  end

  def destroy
    super
    redirect_to root_path
  end

  protected

  def after_sign_up_path_for(resource)
    contractors_profiles_url
  end

end