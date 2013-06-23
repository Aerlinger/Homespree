class HomeownersController < ApplicationController
  layout "static_page", except: [:show, :edit]


  def create
    @homeowner = params[:homeowner] ? Homeowner.new(params[:user]) : Homeowner.new_homeowner_guest

    if @homeowner.save
    else

    end
  end

  def show
    @homeowner = Homeowner.find(params[:id])
  end

end