class Contractors::WizardController < ApplicationController

  include Wicked::Wizard
  steps :essential, :contact_info

  layout "registration"

  def show
    @contractor = current_contractor
    render_wizard
  end

  def update
    @contractor = current_contractor
    @contractor.update_attributes(params[:contractor])

    render_wizard @contractor
  end

  private

  def finish_wizard_path
    contractors_profile_path(current_contractor)
  end

end
