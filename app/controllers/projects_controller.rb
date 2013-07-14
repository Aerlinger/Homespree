class ProjectsController < ApplicationController
  layout "static_page"

  before_filter :create_guest_if_homeowner_not_signed_in, only: :create

  def create
    @project = Project.create(params[:project])
    @location = Address.create(zipcode: params[:project][:zipcode])

    if Rails.env.production?
      render :unavailable
    elsif @project.valid?
      session[:project_id] = @project.id
      redirect_to project_wizard_path(:request)
    else
      redirect_to :back, notice: @project.errors.full_messages.first
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
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
