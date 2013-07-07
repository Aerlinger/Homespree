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

    if @user
      redirect_to contractor_path(id: @user.slug)
    else
      redirect_to new_contractor_session_path, notice: "Could not sign in, please check your details"
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