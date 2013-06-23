class ProjectSubmissionsController < ApplicationController

  include Wicked::Wizard
  steps :request, :review_estimates, :appointment, :submit

  before_filter :find_project

  def show
    render_wizard
  end

  def update
    @project.attributes = params[:project]

    render_wizard @project
  end

  private

  #def redirect_to_finish_wizard
  #  redirect_to root_url, notice: "Project"
  #end

  def finish_wizard_path
    redirect_to homeowner_projects_path(current_homeowner), notice: "project submitted!"
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

end
