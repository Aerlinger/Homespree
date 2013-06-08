# == Schema Information
#
# Table name: mailinglists
#
#  id                    :integer          not null, primary key
#  email                 :string(255)
#  contractor            :boolean          default(FALSE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  notes                 :text
#  submitted_from_mobile :boolean
#

class Mailinglist < ActiveRecord::Base

  # Accessors:  ----------------------------------------------------------------------------------------------------
  attr_accessor :user_type
  attr_accessible :contractor, :email, :user_type, :notes, :submitted_from_mobile

  # Validations:  --------------------------------------------------------------------------------------------------
  validates_presence_of :email, allow_blank: false
  validates_presence_of :user_type, allow_blank: false
  validates_uniqueness_of :email
  validates_format_of :email, with: RegexDefinitions::email_regex

  # Callbacks:  ----------------------------------------------------------------------------------------------------
  after_validation :check_user_type, :downcase_email

  # Custom Methods:  -----------------------------------------------------------------------------------------------
  protected

  # Submission type defaults to homeowner
  def check_user_type
    if self.user_type.present?
      self.contractor = self.user_type.to_s.downcase.include? "contractor"
    else
      self.contractor = false
    end
  end

  def downcase_email
    self.email = email.downcase if self.email.present?
  end

end
