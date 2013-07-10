class Users::SessionsController < Devise::SessionsController
  #before_filter :set_user_type, only: [:create, :update]
  #
  #def new
  #  super
  #  @user = User.new
  #end
  #
  #def create
  #  super
  #
  #  #if @user
  #  #  redirect_to contractor_path(id: @user.slug)
  #  #else
  #  #  redirect_to new_contractor_session_path, notice: "Could not sign in, please check your details"
  #  #end
  #end
  #
  #def destroy
  #  super
  #end
  #
  #protected
  #
  #def after_sign_out_path_for(resource)
  #  root_path
  #end
  #
  #def set_user_type
  #  build_resource
  #  resource = User.find_by_email(params[:user][:email])
  #end
  #def after_sign_in_path_for(resource)
  #  contractor_path id: resource.slug
  #end
  #
  #def after_sign_out_path_for(resource)
  #  root_path
  #end
end