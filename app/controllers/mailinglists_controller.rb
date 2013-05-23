class MailinglistsController < ApplicationController

  def create
    if params && params[:user_type] =~ /contractor/i
      @email = params[:email]
      redirect_to controller: 'contractors/registrations', action: :new, email: params[:email]
      #new_contractor_registration_path({email: params[:user_email]}), params: {email: @email}
    else
      @user_email = Mailinglist.create({ email: params[:email],
                                         user_type: params[:user_type],
                                         submitted_from_mobile: params[:submitted_from_mobile]})

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