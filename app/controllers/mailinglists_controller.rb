class MailinglistsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "goober", except: :create

  # GET /mailinglists
  # GET /mailinglists.json
  def index
    @mailinglists = Mailinglist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mailinglists }
    end
  end

  # GET /mailinglists/1
  # GET /mailinglists/1.json
  def show
    @mailinglist = Mailinglist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mailinglist }
    end
  end

  # GET /mailinglists/new
  # GET /mailinglists/new.json
  def new
    @mailinglist = Mailinglist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mailinglist }
    end
  end

  # GET /mailinglists/1/edit
  def edit
    @mailinglist = Mailinglist.find(params[:id])
  end

  # POST /mailinglists
  # POST /mailinglists.json
  def create
    @mailinglist = Mailinglist.new(params[:mailinglist])

    respond_to do |format|
      if @mailinglist.save
        format.html { redirect_to @mailinglist, notice: 'Mailinglist was successfully created.' }
        format.json { render json: @mailinglist, status: :created, location: @mailinglist }
      else
        format.html { render action: "new" }
        format.json { render json: @mailinglist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mailinglists/1
  # PUT /mailinglists/1.json
  def update
    @mailinglist = Mailinglist.find(params[:id])

    respond_to do |format|
      if @mailinglist.update_attributes(params[:mailinglist])
        format.html { redirect_to @mailinglist, notice: 'Mailinglist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mailinglist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailinglists/1
  # DELETE /mailinglists/1.json
  def destroy
    @mailinglist = Mailinglist.find(params[:id])
    @mailinglist.destroy

    respond_to do |format|
      format.html { redirect_to mailinglists_url }
      format.json { head :no_content }
    end
  end
end
