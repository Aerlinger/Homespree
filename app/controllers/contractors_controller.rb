class ContractorsController < ApplicationController

  layout "static_page", except: [:show, :edit]

  def show
    @location = request.location

    @contractor = Contractor.find(params[:id])
    @address = @contractor.address.decorate
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
    if @contractor.update_attributes(params[:contractor])
      render status: 200, nothing: true
    else
      render status: 422, nothing: true
    end
  end

end