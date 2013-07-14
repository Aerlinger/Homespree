class ContractorMailer < ActionMailer::Base
  default from: "Homespree Support <support@myhomespree.com>"

  def signup(contractor)
    @contractor = contractor
    mail to: @contractor.email, subject: "Welcome to Homespree!"
  end

  def notify_signup(resource, recipient)
    mail to: "#{recipient}@myhomespree.com", subject: "New Contractor Signup: #{resource.email}"
  end
end
