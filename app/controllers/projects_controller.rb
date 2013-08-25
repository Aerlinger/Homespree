class ProjectsController < ApplicationController
  include Concerns::ProjectParams
  layout "static_page"

  before_filter :get_active_user, only: :create

  def create
    if Rails.env.production?
      render :unavailable
    else
      @project  = Project.create!(project_params)
      @location = Address.create!(zipcode: params[:project][:zipcode])

      # Redirect to the project submission wizard if all fields are present
      # display error message otherwise
      if @project.valid?
        session[:project_id] = @project.id
        redirect_to project_wizard_path(:request)
      else
        redirect_to :back, notice: @project.errors.full_messages.first
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.homeowner = current_user if current_user.homeowner? || guest_homeowner
    @project.save
    @project.update_attributes(project_params)
  end

  def show
    @project      = Project.find(params[:id])
    @project      = @project.decorate
    @contractor   = @project.contractor
    @homeowner    = @project.homeowner
    @appointment = @project.appointment
  end

  def unavailable
  end

  def index
  end

  private

  #def project_attributes
    #params.require(:project).permit(:zipcode, :homeowner, :project_type, :project_type_id, :homeowner_id)
  #end

  def get_active_user
    @user = homeowner_signed_in? ? current_user : create_guest_with_zip

    params[:project][:homeowner_id] = @user.id
  end

  def create_guest_with_zip
    return if homeowner_signed_in?
    sign_out current_contractor if contractor_signed_in?

    @guest         = create_guest_homeowner
    @guest.address = Address.create(zipcode: params[:project][:zipcode])
    return @guest
  end
end
