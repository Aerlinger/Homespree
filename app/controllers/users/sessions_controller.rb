class Users::SessionsController < Devise::SessionsController

  #before_filter :redirect_to_user_type

  def new
    super
    @user = User.new
  end

  def create
    super
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