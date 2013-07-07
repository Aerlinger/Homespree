class ProjectWizardController < ApplicationController

  layout "project_wizard"

  include Wicked::Wizard
  steps :request, :review_estimates, :appointment, :submit

  before_filter :find_project
  before_filter :create_guest_if_homeowner_not_signed_in, only: :create

  def create
    @project = Project.create(params[:project])

    if Rails.env.production?
      render :unavailable
    elsif @project.valid?
      # TODO: This work is still in progress
      session[:project_id] = @project.id
      redirect_to project_wizard_path({id: "request", project_id: @project.id})
    else
      redirect_to :back, notice: @project.errors.full_messages.first
    end
  end

  def show
    @project = @project.decorate
    render_wizard
  end

  def update
    @project.attributes = params[:project]

    render_wizard @project
  end

  private

  def create_guest_if_homeowner_not_signed_in
    create_guest_homeowner unless homeowner_signed_in?
  end

  def finish_wizard_path
    redirect_to homeowner_projects_path(current_homeowner), notice: "project submitted!"
  end

  def find_project
    @project ||= Project.find(params[:project_id])
  end

end
