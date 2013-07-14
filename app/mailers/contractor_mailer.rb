class ContractorMailer < ActionMailer::Base
  default from: "anthony@myhomespree.com"

  def signup
    @greeting = "Hi"

    @user = {name: "Anthony"}
    mail to: "aerlinger@gmail.com", subject: "testing homespree email"
  end
end
