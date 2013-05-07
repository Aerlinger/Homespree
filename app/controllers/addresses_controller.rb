class AddressesController < ApplicationController

  respond_to :json

  def show
    redirect_to "/contractors/profiles/#{@contractor.id}"
  end

  def update
    @address = Address.find(params[:id])
    @address.update_attributes(params[:address])

    if @address["addressable_type"] == "Contractor"
      redirect_to "/contractors/profiles/#{@address.addressable_id}", method: :get
    end
  end

end
