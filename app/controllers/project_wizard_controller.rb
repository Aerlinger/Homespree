class ProjectWizardController < ApplicationController
  include Wicked::Wizard
  include Concerns::ProjectParams

  layout "project_wizard"

  steps :request, :review_estimates, :appointment

  before_action :get_project
  before_action :get_contractors, only: :show

  def update
    @project.update_attributes! project_params
    redirect_to action: :show
  end

  def show
    @project = Project.find(session[:project_id])
    @project = @project.decorate
    render_wizard
  end

  private

  def finish_wizard_path
    project_path(@project.id)
  end

  def get_contractors
    if step.to_s == 'review_estimates'
      @contractors = @project.find_nearby_contractors
    end
  end

  def project_params
    # TODO: Add params validation for appointment and homeowner attributes
    params.require(:project).permit(:contractor_id, :project_type_id, :zipcode, :service_type_name)
  end

  def get_project
    @project = Project.find(session[:project_id])
    @homeowner = current_user || @project.homeowner
  end
end
