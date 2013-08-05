class ProjectsController < ApplicationController
  layout "static_page"


  before_filter :get_active_user, only: :create

  def create
    if Rails.env.production?
      render :unavailable
    else
      @project  = Project.create!(params[:project])
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
    @project.update_attributes(params[:project])
  end

  def show
    @project      = Project.find(params[:id])
    @project      = @project.decorate
    @contractor   = @project.contractor
    @homeowner    = @project.homeowner
    @appointments = @project.appointments
  end

  def unavailable
  end

  def index
  end

  private

  def get_active_user
    @user = homeowner_signed_in? ? current_user : create_guest_with_zip

    params[:project][:homeowner] = @user
  end

  def create_guest_with_zip
    unless homeowner_signed_in?
      @guest         = create_guest_homeowner
      @guest.address = Address.create(zipcode: params[:project][:zipcode])
    end
    return @guest
  end
end
