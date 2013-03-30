class MailinglistsController < ApplicationController

  def create
    @user_email = Mailinglist.create!(params)

    respond_to do |format|
        format.js
    end
  end

  def unsubscribe
    @user_email = params[:email]
  end

  # params: email
  def destroy
    @user_email = params[:email]
    mailinglist = Mailinglist.find_by_email(@user_email)
    mailinglist.destroy
  end

end
