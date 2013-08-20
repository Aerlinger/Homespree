class ContractorsController < ApplicationController
  layout "static_page", except: [:show, :edit]

  before_filter :process_params, only: [:update, :create]
  before_filter :authenticate_contractor!, except: [:show, :map]
  #before_action :contractor_params

  respond_to :js, :html, :json, only: :update

  http_basic_authenticate_with name: "admin", password: "MeetMike9", only: :map

  def show
    @contractor = Contractor.find(params[:id])
    @contractor = @contractor.decorate

    respond_to do |format|
      format.html { render "profile" }
      format.js { render js: @contractor }
      format.json { render json: @contractor }
    end
  end

  def update
    @contractor = Contractor.find(params[:id])
    @contractor.update_attribute(:edited, true)
    @contractor.update_attributes(params[:contractor])
    respond_with @contractor, layout: false
  end

  def settings
  end

  def material_calculator
  end

  def browse
  end

  def map
    @contractors = Contractor.all

    @json = @contractors.to_gmaps4rails do |user, marker|
      marker.infowindow render_to_string(:partial => "/contractors/contractor", :locals => { :object => user})
      marker.picture({
                       :picture => "http://www.blankdots.com/img/github-32x32.png",
                       :width   => 32,
                       :height  => 32
                     })
      marker.title   "i'm the title"
      marker.sidebar "i'm the sidebar"
      marker.json({ :id => user.id, :foo => "bar" })
    end
  end

  private

  def process_params
    if params[:contractor]
      [:insurance_limit, :bonding_limit, :hourly_rate].each do |attr|
        params[:contractor][attr].gsub!(/([$,#]|(\..+))/, '') if params[:contractor][attr]
      end
    end
  end

  def contractor_params
    params.require(:contractor).permit(:company_title, :email, :password)
  end
end