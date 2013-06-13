class ContractorsController < ApplicationController

  layout "static_page", except: [:show, :edit]

  before_filter :find_location

  def show
    @contractor = Contractor.find(params[:id])
    @address ||= @contractor.address
    @specialty = Specialty.new
    @specialties = @contractor.specialties
    @photos = @contractor.photos

    @contractor = @contractor.decorate

    respond_to do |format|
      format.html { render "profile" }
      format.json { render json: @contractor }
    end
  end

  def update
    @contractor = Contractor.find(params[:id])

    if request.xhr? && !@contractor.edited?
      @contractor.update_attribute(:edited, true)
    end

    if @contractor.update_attributes(params[:contractor])
      render status: 200, nothing: true
    else
      render status: 422, nothing: true
    end
  end

  def find_location
    @address = Address.new do |a|
      a.city = request.location.city || "New York"
      a.zipcode = request.location.postal_code || 10027
      a.latitude = request.location.latitude || -33.9417
      a.longitude = request.location.longitude || 150.9473
    end
  end

end