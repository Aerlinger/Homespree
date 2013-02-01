class EmailListController < ApplicationController
  def create

    @email = params[:email]

    EmailList.create!(email: @email)

    respond_to do |format|
      format.js { render :json => params }
    end
  end

  def update
  end

  def destroy
  end
end
