class Specialty < ActiveRecord::Base
  attr_accessible :contractor_id, :endorsements, :endorser_id, :name
end
