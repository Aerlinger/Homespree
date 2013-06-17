class ContractorsController < ApplicationController

  layout "static_page", except: [:show, :edit]

  def show
    @contractor = Contractor.find(params[:id])
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
      if request.xhr? && !@contractor.edited?
        @contractor.update_attribute(:edited, true)
        render status: 200, nothing: true
      else
        redirect_to contractor_path(id: @contractor.id)
      end
    else
      render status: 422, nothing: true
    end
  end

  # Static page showing Contractor settings
  def settings
  end

  def material_calculator
  end

end