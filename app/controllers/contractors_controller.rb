class ContractorsController < ApplicationController
  layout "static_page", except: [:show, :edit]

  before_filter :process_params, only: [:update, :create]

  respond_to :html, :json, only: :update

  def show
    @contractor = Contractor.find(params[:id])
    @contractor = @contractor.decorate

    respond_to do |format|
      format.html { render "profile" }
      format.json { render json: @contractor }
    end
  end

  def update
    @contractor = Contractor.find(params[:id])

    if @contractor.update_attributes(params[:contractor])
      if request.xhr? && !@contractor.edited?
        @contractor.update_attribute(:edited, true)
        render status: 200, nothing: true
      else
        redirect_to contractor_path(id: @contractor.slug)
      end
    else
      redirect_to contractor_path(id: @contractor.slug, notice: "Couldn't save contractor")
    end
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