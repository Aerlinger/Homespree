class MailinglistsController < ApplicationController

  def create
    @user_email = Mailinglist.create({ email: params[:email], user_type: params[:user_type], submitted_from_mobile: params[:submitted_from_mobile]})

    @user_type = params[:user_type]

    respond_to do |format|
      format.js { render :layout=>false }
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
