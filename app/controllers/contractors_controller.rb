class ContractorsController < ApplicationController
  layout "static_page", except: [:show, :edit]

  before_filter :process_params, only: [:update, :create]

  respond_to :js, :html, :json, only: :update

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

  private

  def process_params
    if params[:contractor]
      [:insurance_limit, :bonding_limit, :hourly_rate].each do |attr|
        params[:contractor][attr].gsub!(/([$,#]|(\..+))/, '') if params[:contractor][attr]
      end
    end
  end

end