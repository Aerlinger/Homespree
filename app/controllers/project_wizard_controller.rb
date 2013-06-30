class ProjectWizardController < ApplicationController

  layout "project_wizard"

  include Wicked::Wizard
  steps :request, :review_estimates, :appointment, :submit

  before_filter :find_project

  def show
    @project = @project.decorate
    render_wizard
  end

  def update
    @project.attributes = params[:project]

    render_wizard @project
  end

  private

  def finish_wizard_path
    redirect_to homeowner_projects_path(current_homeowner), notice: "project submitted!"
  end

  def find_project
    @project ||= Project.find(params[:project_id])
  end

end
