class ContractorsController < ApplicationController

  def new
    @contractor = Contractor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contractor }
      format.js
    end
  end

  def create
    @contractor = Contractor.new(params[:contractor])

    respond_to do |format|
      if @contractor.save
        format.html { redirect_to @contractor, message: "Welcome to Homespree" }
      else
        format.html { render action: "new" }
      end
    end
  end

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

  def edit
    @contractor = Contractor.find(params[:id])
  end

  def update
    @contractor = Contractor.find(params[:id])

    respond_to do |format|
      if @contractor.update_attributes(params[:contractor])
        format.html { redirect_to @contractor, notice: 'Profile updated' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contractor = Contractor.find(params[:id])
    @contractor.destroy
    redirect_to root_path, :flash => { :success => "Profile deleted" }
  end

end
