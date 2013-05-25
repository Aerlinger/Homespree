class Contractors::ProfilesController < ApplicationController

  layout "static_page", except: [:show, :edit]

  http_basic_authenticate_with name: "admin", password: "Meetmike9", only: :index

  after_filter :contractor_is_old, only: [:show]

  def index
    @contractors = Contractor.all

    respond_to do |format|
      format.html
      format.json { render json: @contractors }
    end
  end

  def show
    @location = request.location

    @contractor = Contractor.find(params[:id])
    @address = @contractor.address.decorate
    @specialty = Specialty.new
    @specialties = @contractor.specialties
    @photos = @contractor.photos

    @contractor = @contractor.decorate

    @is_new = @contractor.new_profile

    respond_to do |format|
      format.html
      format.json { render json: @contractor }
    end
  end

  def add_specialty
    respond_to do |format|
      format.js { render :layout=>false }
    end
  end

  def add_photo
    respond_to do |format|
      format.js { render :layout=>false }
    end
  end

  def edit
    @contractor = Contractor.find(params[:id])
  end

  def update
    @contractor = Contractor.find(params[:id])
    if @contractor.update_attributes(params[:contractor])
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def contractor_is_old
    @contractor.update_attribute(:new_profile, false)
  end

end