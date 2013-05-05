class Specialty < ActiveRecord::Base
  attr_accessible :name, :contractor_id, :endorsements, :endorser_id, :other_specialties

  belongs_to :contractor

  validates_presence_of :name

  #before_update :delete_if_empty

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

  protected

  def delete_if_empty
    if name.blank?
      self.destroy
    end
  end

end