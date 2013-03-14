class Contractors::ProfilesController < ApplicationController

  def index
    @contractors = Contractor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contractors }
    end
  end

  def show
    @contractor = Contractor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contractors }
      format.js
    end
  end

end
