class Payment < ActiveRecord::Base
  attr_accessible :amount, :description, :recipient
end
