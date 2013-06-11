class Contractors::RegistrationsController < Devise::RegistrationsController

  respond_to :html, :json

  def new
    super
    @contractor = Contractor.new({email: params[:email]})
  end

  def create
    super
    #@contractor = Contractor.new({email: params[:email]})
    #respond_with @contractor
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
end