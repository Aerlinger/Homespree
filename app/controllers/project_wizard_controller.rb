class ProjectWizardController < ApplicationController
  layout "project_wizard"

  include Wicked::Wizard
  steps :request, :review_estimates, :appointment

  before_filter :find_project
  before_filter :find_contractors, only: :show


  def show
    @project = Project.find(session[:project_id])
    @project = @project.decorate
    render_wizard
  end

  def update
    @project.update_attributes params[:project]
    redirect_to action: :show
  end

  private

  def finish_wizard_path
    project_path(@project.id)
  end

  def find_contractors
    if step.to_s == 'review_estimates'
      @contractors = @project.find_nearby_contractors
    end
  end

  def find_project
    @project = Project.find(session[:project_id])
    @homeowner = current_user || @project.homeowner
  end
end
