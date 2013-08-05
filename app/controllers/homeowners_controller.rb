class HomeownersController < ApplicationController
  layout "dashboard"

  before_filter :authenticate_homeowner!

  def show
    @homeowner = Homeowner.find(params[:id])

    respond_to do |format|
      format.html { render "profile" }
      format.js { render js: @homeowner }
      format.json { render json: @homeowner }
    end
  end
end