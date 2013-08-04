class ProjectWizardController < ApplicationController
  layout "project_wizard"

  include Wicked::Wizard
  steps :request, :review_estimates, :appointment

  before_filter :find_project
  before_filter :find_contractors, only: :show
  before_filter :create_guest_if_homeowner_not_signed_in, only: :create

  before_filter :process_params, only: :update
  before_filter :set_status, only: :update

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

  def create_guest_if_homeowner_not_signed_in
    create_guest_homeowner unless homeowner_signed_in?
  end

  def finish_wizard_path
    project_path(@project.id)
  end

  def find_contractors
    if step.to_s == 'review_estimates'
      @contractors = @project.find_nearby_contractors
    end
  end

  def set_status
    #unless step.to_s == 'request'
    #  params[:project][:submission_status] = step.to_s
    #  params[:project][:submission_status] = 'active' if step == steps.last
    #end
  end

  def process_params
    #params[:project] = {}
    #params[:project][:homeowner_id] = current_user.id
  end

  def find_project
    @project = Project.find(session[:project_id])
    @homeowner = current_user
  end
end
