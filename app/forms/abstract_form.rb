class AbstractForm

  # Can be replaced with ActiveModel::Model in Rails 4
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  validates_presence_of :username
  #validates_uniqueness_of :username

  def persisted?
    false
  end

  def initialize(homeowner)
    @homeowner = homeowner
  end

  def submit(params)

  end

end