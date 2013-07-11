class Homeowners::RegistrationsController < Devise::RegistrationsController
  def new
    super
    @homeowner = Homeowner.new({email: params[:email]})
  end

  protected

  def after_sign_up_path_for(resource)
    homeowner_path id: resource.id
  end
end