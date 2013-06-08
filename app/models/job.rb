class Job < ActiveRecord::Base
  belongs_to :appointment

  has_many :categories


end
