class Specialty < ActiveRecord::Base
  attr_accessible :name, :contractor_id, :endorsements, :endorser_id, :other_specialties

  # Contractor job specialties
  def self.types
    {
      interior_painting: "Interior Painting",
      exterior_painting: "Exterior Painting",
      power_washing: "Power Washing",
      deck_painting: "Deck Painting/Staining",
      fence_painting: "Fence Painting",
      drywall: "Drywall Hanging and Finishing",
      drywall_repair: "Drywall Repair",
      wallpaper_hanging: "Wallpaper Hanging",
      wallpaper_removal: "Wallpaper Removal",
      hardwood_refinishing: "Hardwood Refinishing",
      concrete_staining: "Concrete Staining / Epoxy",
      cabinetry_painting: "Cabinetry Painting",
      furniture_painting: "Furniture Painting",
      faux_finishing: "Faux Finishing"
    }
  end


  belongs_to :contractor

  validates_presence_of :name, allow_blank: false

  validates :name, inclusion: {in: self.types}

  protected

  def delete_if_empty
    if name.blank?
      self.destroy
    end
  end
end