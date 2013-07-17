class Users::SessionsController < Devise::SessionsController
  layout "login_page"

  def new
    super
  end

  def create
    super
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    url_for(resource)
  end
end