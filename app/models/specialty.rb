# == Schema Information
#
# Table name: specialties
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  endorser_id   :integer
#  contractor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string(255)
#  position      :integer
#  hourly_rate   :decimal(, )      default(50.0)
#

class Specialty < ActiveRecord::Base
  attr_accessible :name, :contractor_id, :endorsements, :endorser_id, :other_specialties

  # Contractor job specialties
  def self.painting_types
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

  validates_inclusion_of :name, in: self.painting_types.values, message: "is not a valid service type"

  acts_as_list

  default_scope order("position")

end
