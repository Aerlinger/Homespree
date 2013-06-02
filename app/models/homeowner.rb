class Homeowner < ActiveRecord::Base
  attr_accessible :address, :appointments, :email, :first_name, :last_name, :photos
end
