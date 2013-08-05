class Contractors::RegistrationsController < Users::RegistrationsController
  #after_filter :send_welcome_email, :send_notification_email, only: [:create]

  #def new
    #super
    #@contractor = Contractor.new({ email: params[:email] })
  #end

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
end