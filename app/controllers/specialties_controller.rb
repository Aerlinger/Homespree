class SpecialtiesController < ApplicationController
  respond_to :json

  def show
    @specialty = Specialty.find(params[:id])

    respond_with @specialty
  end
end
