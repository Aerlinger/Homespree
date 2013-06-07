class AddressesController < ApplicationController

  respond_to :js

  def show
    redirect_to "/contractors/#{@contractor.id}"
  end

  def update
    @address = Contractor.find(params[:contractor_id]).address
    @address.update_attributes(params[:address])

    respond_to do |format|
      format.js { render layout: false }
    end
  end

end
