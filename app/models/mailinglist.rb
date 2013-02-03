class Mailinglist < ActiveRecord::Base
  attr_accessible :contractor, :email

  validate_presence_of :email
end
