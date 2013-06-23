class ProjectsController < ApplicationController

  before_filter :create_guest_if_homeowner_not_signed_in, only: :create

  def create
    @project = Project.new({category_name: params[:category_name], zipcode: params[:zipcode]})
    current_user.projects << @project

    redirect_to project_submission_path("request", project_id: @project.id)
  end

  private

  def create_guest_if_homeowner_not_signed_in

  end

end
