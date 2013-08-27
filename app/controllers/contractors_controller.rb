class ContractorsController < ApplicationController
  include Concerns::ContractorParams

  layout "static_page", except: [:show, :edit]

  before_filter :process_params, only: [:update, :create]
  before_filter :authenticate_contractor!, except: [:show, :map]

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
    @contractor.update_attributes(contractor_params)
    respond_with @contractor, layout: false
  end

  def settings
  end

  def material_calculator
  end

  def browse
  end

  private

  def process_params
    if params[:contractor]
      [:insurance_limit, :bonding_limit, :hourly_rate].each do |attr|
        params[:contractor][attr].gsub!(/([$,#]|(\..+))/, '') if params[:contractor][attr]
      end
    end
  end
end
