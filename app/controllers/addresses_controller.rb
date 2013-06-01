class AddressesController < ApplicationController

  respond_to :js

  def show
    redirect_to "/contractors/#{@contractor.id}"
  end

  def update
    if params[:contractor_id]
      @contractor = Contractor.find(params[:contractor_id])
      @address = @contractor.address
    end

    @address.update_attributes(params[:address])

    #respond_with @address, layout: :none
    respond_to do |format|
      format.js { render layout: :none }
    end
  end

end
