class Mailinglist < ActiveRecord::Base
  attr_accessor :user_type
  attr_accessible :contractor, :email, :user_type, :notes, :submitted_from_mobile

  validates_presence_of :email, allow_blank: false
  validates_presence_of :user_type, allow_blank: false
  validates_uniqueness_of :email
  validates :email, format: {with: RegexDefinitions::email_regex}

  before_validation :check_user_type, :downcase_email

  private

  # Submission type defaults to homeowner
  def check_user_type
    self.contractor = self.user_type.to_s.downcase.include? "contractor"
  end

  def downcase_email
    self.email = email.downcase if self.email.present?
  end

end
