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

end