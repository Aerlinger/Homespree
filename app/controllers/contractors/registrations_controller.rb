class Contractors::RegistrationsController < Devise::RegistrationsController

  layout "registration"

  def new
    super
    @contactor = Contractor.new
  end

  protected

  def after_sign_up_path_for(resource)
    contractors_wizard_index_path
  end

end