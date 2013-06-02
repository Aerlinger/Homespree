class Homeowners::RegistrationsController < Devise::RegistrationsController

  respond_to :html, :json

  def new
    super
    @contractor = Homeowner.new({email: params[:email]})
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
    homeowner_path id: resource.id
  end
end