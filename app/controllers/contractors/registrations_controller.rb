class Contractors::RegistrationsController < Devise::RegistrationsController

  layout "registration"

  def new
    super
    @contactor = Contractor.new
    @contractor.addresses.build
  end

  protected

  def after_sign_up_path_for(resource)
    redirect_to contractor_profile_path, params: {id: current_contractor.id}
  end

end