class Contractors::RegistrationsController < Devise::RegistrationsController

  def new
    super
    @contactor = Contractor.new
  end

  def show
    super
    @contractor = current_contractor
    render_wizard
  end

  def update
    @contractor = current_contractor
    @contractor.attributes = params[:contractor]
    render_wizard @contractor
  end

  protected

  def after_sign_up_path_for(resource)
    contractors_wizard_index_path
  end

end