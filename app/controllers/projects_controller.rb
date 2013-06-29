class ProjectsController < ApplicationController

  layout "static_page"

  before_filter :create_guest_if_homeowner_not_signed_in, only: [:create]

  def create
    @project = Project.create(params[:project])

    render :unavailable
    # TODO: Uncomment this when project wizard is ready
    # redirect_to project_wizard_path("request", project_id: @project.id)
  end

  def unavailable
  end

  def index
  end

  private

  def create_guest_if_homeowner_not_signed_in
    create_guest_homeowner unless homeowner_signed_in?
  end

end
