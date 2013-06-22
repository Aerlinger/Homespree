class Users::SessionsController < Devise::SessionsController

  def new
    super
    @homeowner = Homeowner.new
  end

  def create
    super
  end

  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    #redirect_to controller: :homewowners, action: :show
    homeowner_path id: resource.id
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end