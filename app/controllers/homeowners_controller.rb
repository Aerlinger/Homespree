class HomeownersController < ApplicationController
  layout "static_page", except: [:show, :edit]

  def show
    @homeowner = Homeowner.find(params[:id])
  end

end