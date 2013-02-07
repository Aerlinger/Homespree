class MailinglistsController < ApplicationController

  layout "administration"

  before_filter :authenticate


  def new
    @mailinglist = Mailinglist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mailinglist }
    end
  end


  def index
    @mailinglists = Mailinglist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mailinglists }
    end
  end


  def edit
    @mailinglist = Mailinglist.find(params[:id])
  end


  def create

    # Todo: needs to be cleaned up: (separate route for XHR?)
    respond_to do |format|
      if request.xhr?
        @email = params[:email]
        Mailinglist.create!(email: @email)
        format.js { render :json => params }
      else
        @mailinglist = Mailinglist.new(params[:mailinglist])
        if @mailinglist.save
          format.html { redirect_to mailinglists_path, notice: 'Mailinglist was successfully created.' }
          format.json { render json: @mailinglist, status: :created, location: @mailinglist }
        else
          format.html { render action: "new" }
          format.json { render json: @mailinglist.errors, status: :unprocessable_entity }
        end
      end
    end
  end


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

  def destroy
    @mailinglist = Mailinglist.find(params[:id])
    @mailinglist.destroy

    respond_to do |format|
      format.html { redirect_to mailinglists_url }
      format.json { head :no_content }
    end
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "Meetmike"
    end
  end

end
