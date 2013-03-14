class MailinglistsController < ApplicationController

  def create
    email = params[:email]
    user_type = params[:user_type]

    @user_email = Mailinglist.create(email: email, user_type: user_type)

    respond_to do |format|
        format.js
    end
  end

end
