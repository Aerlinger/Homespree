class Mailinglist < ActiveRecord::Base
  attr_accessible :contractor, :email, :user_type, :notes
  attr_accessor :user_type

  validates_presence_of :user_type, :email, allow_blank: false

  before_save :check_user_type

  private

  def check_user_type
    self.contractor = self.user_type.downcase == "contractor"
    true
  end

end
