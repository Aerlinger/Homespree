class Users::SessionsController < Devise::SessionsController

  #before_filter :redirect_to_user_type

  #before_filter :set_user_type, only: [:create, :update, :destroy]

  def new
    super
    @user = User.new
  end

  def create
    #super
    @user = User.find_by_email(params[:user][:email])

    if @user.homeowner?
      redirect_to controller: "homeowners/sessions", action: "create"
    elsif @user.contractor?
      redirect_to controller: "contractors/sessions", action: "create"
    end
  end

  def destroy
    super
  end

  protected

  #def after_sign_in_path_for(resource)
  #  redirect_to resource
  #end



  def after_sign_out_path_for(resource)
    root_path
  end


end