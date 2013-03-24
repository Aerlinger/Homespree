class Contractors::WizardController < ApplicationController

  include Wicked::Wizard
  steps :contact_details, :location_details

  before_filter :redirect_if_not_signed_in

  layout "registration"

  def show
    @contractor = current_contractor
    render_wizard
  end

  def update
    @contractor = current_contractor
    params[:contractor].delete_if {|k,v| v.blank?}
    @contractor.update_attributes params[:contractor]
    @contractor.save

    render_wizard @contractor
  end

  private

  def finish_wizard_path
    contractors_profile_path current_contractor
  end

  def redirect_if_not_signed_in
    unless contractor_signed_in?
      redirect_to new_contractor_registration_path
    end
  end

end
