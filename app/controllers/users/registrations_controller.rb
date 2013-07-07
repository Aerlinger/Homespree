class Users::RegistrationsController < Devise::RegistrationsController
  layout "login_page", only: [:new, :edit]
  respond_to :html, :json

  def new
    super
  end

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
    redirect_to root_path
  end

  def cancel
    super
  end
end