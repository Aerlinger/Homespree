class PhotosController < ApplicationController

  def new
    @photo = Photo.new

    respond_to do |format|
      format.js { render :layout=>false }
    end
  end

  def create
    @photo.create(params[:photo])
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
  end
end
