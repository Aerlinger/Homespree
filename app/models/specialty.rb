class Specialty < ActiveRecord::Base
  attr_accessible :name, :contractor_id, :endorsements, :endorser_id, :other_specialties

  belongs_to :contractor

  validates_presence_of :name, allow_blank: false

  # Contractor job specialties
  def self.types
    job_types = [
        "Additions & Remodeling",
        "Air Conditioning",
        "Architects & Engineers",
        "Audio/Visual & Computers",
        "Brick & Stone",
        "Cleaning & Maid Services",
        "Concrete",
        "Decks",
        "Designers & Decorators",
        "Drywall & Plaster",
        "Electrical",
        "Fences",
        "Flooring & Carpet",
        "Furniture Repair &amp; Refinish",
        "Garage & Garage Doors",
        "Handyman Services",
        "Heating & Furnace Systems",
        "Landscaping",
        "Lawn & Garden Care",
        "Mold & Asbestos Services",
        "New Home Builders",
        "Paving",
        "Plumbing",
        "Roofing",
        "Sheds & Enclosures",
        "Siding",
        "Swimming Pools",
        "Tile",
        "Tree Service",
        "Waste Material Removal",
        "Windows"
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