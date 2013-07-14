class ProjectWizardController < ApplicationController
  layout "project_wizard"

  include Wicked::Wizard
  steps :request, :review_estimates, :appointment, :submit

  before_filter :create_guest_if_homeowner_not_signed_in, only: :create

  def show
    @project = Project.find(session[:project_id])
    @project = @project.decorate
    render_wizard
  end

  def update
    params[:product][:status] = step.to_s
    params[:product][:status] = 'active' if step == steps.last
    @project.update_attributes params[:project]
    render_wizard @project
  end

  private

  def create_guest_if_homeowner_not_signed_in
    create_guest_homeowner unless homeowner_signed_in?
  end

  def redirect_to_finish_wizard
    redirect_to homeowner_projects_path(current_homeowner), notice: "project submitted!"
  end
end
