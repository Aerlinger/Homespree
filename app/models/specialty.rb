class Specialty < ActiveRecord::Base
  attr_accessible :contractor_id, :endorsements, :endorser_id, :other_specialties

  # Contractor job specialties
  def self.types
    job_types = [
      "Painting",
     "Roofing",
     "Electrical",
     "Bathroom Modeling",
     "Concrete",
     "Architecture",
     "Drywall",
     "Landscaping",
     "Swimming Pools",
     "Plumbing",
     "Wallpaper",
     "Fences",
     "Flooring",
     "Ceiling",
     "Lighting",
     "General Contracting",
     "Heating & Air Conditioning",
     "Windows & Blinds",
     "Demolition",
     "Fumigation"
    ]

    return job_types.sort!
  end

end