class PhotosController < ApplicationController
  include Concerns::PhotoParams

  def create
    # Find the contractor (photographable type)
    @photo = Photo.new(photo_params)
    id = params[:contractor_id]
    @contractor = Contractor.find(id)
    @contractor.photos << @photo
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete

    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
