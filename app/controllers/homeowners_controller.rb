class HomeownersController < ApplicationController
  layout "static_page", except: [:show, :edit]

  http_basic_authenticate_with name: "admin", password: "Meetmike9", only: :index

  def new
    @homeowner = Homeowner.new
  end

  def create
    @homeowner = Homeowner.new(params[:homeowner])
    if @homeowner.save
      redirect_to action: :show
    else
      redirect_to action: :new
    end

  end

  def update
    @homeowner = Homeowner.find(params[:id])
    if @homeowner.update_attributes(params[:homeowner])
      redirect_to(action: :show)
    else
      redirect_to(action: :edit)
    end
  end

  def show
    @homeowner = Homeowner.find(params[:id])
  end

  def index
    @homeowners = Homeowner.all

    respond_to do |format|
      format.html
      format.json { render json: @homeowners }
    end
  end

  def destroy
    @homeowner = Homeowner.find(params[:id])
    @homeowner.destroy

    redirect_to root_path, message: "Deleted user"
  end

end