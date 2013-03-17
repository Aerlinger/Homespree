class Specialty < ActiveRecord::Base
  attr_accessible :contractor_id, :endorsements, :endorser_id, :name

  # Contractor job specialties are stored in a separate YAML config file:
  def self.types
    @@types ||= YAML.load_file(Rails.root.join("config", "contractor_specialties.yml"))
  end

end