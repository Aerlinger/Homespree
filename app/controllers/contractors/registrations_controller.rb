class Contractors::RegistrationsController < Users::RegistrationsController
  #after_filter :send_welcome_email, :send_notification_email, only: [:create]

  before_filter :update_sanitized_params, if: :devise_controller?



  protected

  def after_sign_up_path_for(resource)
    contractor_path id: resource.slug
  end

  def send_welcome_email
    ContractorMailer.signup(resource).deliver
  end

  def send_notification_email
    %w[anthony].each do |admin|
      ContractorMailer.notify_signup(resource, admin).deliver
    end
  end

  private

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:company_title, :email, :password)}
  end
end
