class AddressesController < ApplicationController

  respond_to :json

  def show
    redirect_to "/contractors/profiles/#{@contractor.id}"
  end

  def update
    if params[:contractor_id]
      @contractor = Contractor.find(params[:contractor_id])
      @address = @contractor.address
    end

    @address.update_attributes(params[:address])
  end

end
