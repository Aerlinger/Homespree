class JobSubmissionsController < ApplicationController

  include Wicked::Wizard
  steps :first_step, :project_details, :review_requests, :submit


  def show
    @homeowner = current_homeowner
    render_wizard
  end

  def update
    @homeowner = current_homeowner
    @homeowner.attributes = params[:homeowner]
  end

  private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thank you for signing up."
  end

end
