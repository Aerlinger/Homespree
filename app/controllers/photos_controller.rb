class PhotosController < ApplicationController
  respond_to :html, :json

  def new
    @photo = Photo.new
    respond_with(@photo)
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
