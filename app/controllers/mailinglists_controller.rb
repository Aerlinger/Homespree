class MailinglistsController < ApplicationController
  def create
    @mailinglist = Mailinglist.new(mailinglist_params)

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

  private

  def mailinglist_params
    params.require(:mailinglist).permit(:email, :username, :name, :zipcode, :user_type)
  end
end