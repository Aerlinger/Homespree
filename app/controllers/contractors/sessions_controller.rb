class Contractors::SessionsController < Devise::SessionsController

  def new
    super
    @contactor = Contractor.new
  end

  def create
    super
  end

  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    contractor_path id: resource.id
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end