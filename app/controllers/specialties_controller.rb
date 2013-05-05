class SpecialtiesController < ApplicationController
  respond_to :html, :json

  def create
    @contractor = Contractor.find(params[:contractor_id])
    @specialty = params[:specialty]

    @contractor.specialties << Specialty.create(name: @specialty['name'])
    @contractor.save!

    redirect_to "/contractors/profiles/#{@contractor.id}"
  end

  def show
    @specialty = Specialty.find(params[:id])

    respond_with @specialty
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

    redirect_to "/contractors/profiles/#{@contractor.id}"
  end
end
