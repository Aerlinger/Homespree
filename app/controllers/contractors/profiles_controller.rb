class Contractors::ProfilesController < ApplicationController

  layout "static_page", except: [:show, :edit]

  http_basic_authenticate_with name: "admin", password: "Meetmike9", only: :index

  def index
    @contractors = Contractor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contractors }
    end
  end

  def show
    @contractor = Contractor.find(params[:id])
    @contractor.decorate
  end

  def edit
    @contractor = Contractor.find(params[:id])
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