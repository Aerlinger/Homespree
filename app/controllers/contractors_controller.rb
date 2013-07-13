class ContractorsController < ApplicationController
  layout "static_page", except: [:show, :edit]

  before_filter :process_params, only: [:update, :create]

  respond_to :html, :json, only: :update

  def show
    @contractor = Contractor.find(params[:id])
    @contractor = @contractor.decorate

    #@portrait_uploader = @contractor.portrait_url
    #@logo_uploader = @contractor.logo_url
    #@uploader.success_action_redirect = contractor_path(@contractor)

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

  # Static page showing Contractor settings
  def settings
  end

  def material_calculator
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