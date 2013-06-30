class ProjectsController < ApplicationController

  layout "static_page"

  before_filter :create_guest_if_homeowner_not_signed_in, only: :create

  def create
    @project = Project.create(params[:project])

    if Rails.env.production?
      render :unavailable
    else
      # TODO: This work is still in progress
      session[:project_id] = @project.id
      redirect_to project_wizard_path({id: "request", project_id: @project.id})
    end
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
