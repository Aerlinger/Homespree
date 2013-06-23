# Step 1 of Project Submission
class RequestForm < Reform::Form

  include DSL

  property :zipcode
  property :category
  property :subcategory

  validates :zipcode, presence: true

  # Example for Painting::WoodFloorFinishing:
  property :current_finish
  property :desired_finish
  property :square_feet

end