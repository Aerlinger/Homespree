class Mailinglist < ActiveRecord::Base
  attr_accessible :contractor, :email, :user_type, :notes
  attr_accessor :user_type

  validates_presence_of :user_type, :email, allow_blank: false
  validates_uniqueness_of :email
  validates :email, format: { with: email_regex }

  before_save :check_user_type
  before_validation :downcase_email

  private

  def check_user_type
    self.contractor = (user_type.downcase == "contractor")
  end

  def downcase_email
    self.email = email.downcase if self.email.present?
  end

end
