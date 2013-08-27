class Homeowners::RegistrationsController < Users::RegistrationsController
  #include Concerns::HomeownerParams

  before_filter :update_sanitized_params, if: :devise_controller?

  def new
    super
    @homeowner = Homeowner.new({email: params[:email]})
    #@homeowner = Homeowner.new(homeowner_params)
  end

  protected

  def after_sign_up_path_for(resource)
    my_projects_path
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :first_name, :last_name, :zipcode)}
  end
end
