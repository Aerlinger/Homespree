class Contractors::SessionsController < Devise::SessionsController

  layout "registration"

  def new
    super
    @contactor = Contractor.new
  end

  def show
    super
    @contractor = current_contractor
  end

  def update
    @contractor = current_contractor
    @contractor.attributes = params[:contractor]
  end

  def after_sign_in_path_for(resource)
    contractors_profile_path id: resource.id
  end

end