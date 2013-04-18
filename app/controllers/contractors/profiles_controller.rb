class Contractors::ProfilesController < ApplicationController

  layout "static_page", except: [:show]

  def index
    @contractors = Contractor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contractors }
    end
  end

  def show
    @contractor = Contractor.find(params[:id])
  end

  def edit
    @contractor = Contractor.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @contractor = Contractor.find(params[:id])
    if @contractor.update_attributes(params[:contractor])
      redirect_to action: :show
    else
      render :edit
    end
  end

end