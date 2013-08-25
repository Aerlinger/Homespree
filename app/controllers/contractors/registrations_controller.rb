class Contractors::RegistrationsController < Users::RegistrationsController
  include Concerns::ContractorParams

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
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:company_title,
                                                             :email,
                                                             :password,
                                                             :first_name,
                                                             :last_name,
                                                             :office_number,
                                                             :mobile_number,
                                                             :website,
                                                             :facebook,
                                                             :twitter,
                                                             :license,
                                                             :bonding_limit,
                                                             :insurance_limit,
                                                             :hourly_rate,
                                                             :slogan,
                                                             :description,
                                                             address_attributes:      [:zipcode, :line1, :line2, :city, :state],
                                                             appointments_attributes: [:address, :starts_at, :duration, :attributes, :zipcode],
                                                             photos_attributes:       [:image_url, :name, :caption]
    ) }
  end
end
