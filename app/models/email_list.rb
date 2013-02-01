class EmailList < ActiveRecord::Base
  attr_accessible :contractor, :email

  validates_presence_of :email


end
