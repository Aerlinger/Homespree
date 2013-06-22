class ProjectSubmissionsController < ApplicationController

  include Wicked::Wizard
  steps :request, :review_estimates, :appointment, :submit


  def show
    @homeowner = current_homeowner
    render_wizard
  end

  def update
    @homeowner = current_homeowner
    @homeowner.attributes = params[:homeowner]
  end

  private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Project"
  end

  def finish_wizard_path

  end

end
