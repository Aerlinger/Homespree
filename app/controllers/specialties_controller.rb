class SpecialtiesController < ApplicationController
  respond_to :json, :js

  def create
    @contractor = Contractor.find(params[:contractor_id])
    @specialty = Specialty.create!(name: params[:specialty_name])

    @contractor.specialties << @specialty
    @contractor.save!

    respond_to do |format|
      format.js { render layout: false }
    end

  end

  def show
    @specialty = Specialty.find(params[:id])

    respond_to do |format|
      format.json { render json: @specialty }
    end
  end

  def edit
    @specialty = Specialty.find(params[:id])
  end

  def update
    @specialty = Specialty.find(params[:id])
    @specialty.update_attributes(params[:specialty])
    respond_with @specialty
  end

  def destroy
    @specialty = Specialty.find(params[:id])
    @contractor = Contractor.find(params[:contractor_id])
    @specialty.destroy

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def sort
    params[:specialty].each_with_index do |id, index|
      Specialty.update_all({position: index+1}, {id: id})
    end

    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
