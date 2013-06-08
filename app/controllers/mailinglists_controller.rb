class MailinglistsController < ApplicationController

  def create
    @mailinglist = Mailinglist.new(params[:mailinglist])

    if params && params[:user_type] =~ /contractor/i
      @mailinglist.save
      redirect_to controller: 'contractors/registrations', action: :new, email: @mailinglist.email
    else
      @user_email = @mailinglist.save

      respond_to do |format|
        format.js { render :layout=>false }
      end
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