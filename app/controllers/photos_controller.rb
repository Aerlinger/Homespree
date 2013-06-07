class PhotosController < ApplicationController

  def new
    @photo = Photo.new

    respond_to do |format|
      format.js { render :layout=>false }
    end
  end

  def create
    # Find the contractor (photographable type)
    @photo = Photo.new(params[:photo])
    id = params[:contractor_id]
    Contractor.find(id).photos << @photo
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
