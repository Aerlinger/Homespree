class Homeowners::RegistrationsController < Users::RegistrationsController
  def new
    super
    @homeowner = Homeowner.new({email: params[:email]})
  end

  protected

  def after_sign_up_fails_path_for(resource)
    new_homeowner_registration_path
  end

  def after_sign_up_path_for(resource)
    homeowner_path id: resource.id
  end
end