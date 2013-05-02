class Contractors::RegistrationsController < Devise::RegistrationsController

  def new
    super
    @contactor = Contractor.new
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
end