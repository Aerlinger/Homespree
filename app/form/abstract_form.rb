class AbstractForm

  # Can be replaced with ActiveModel::Model in Rails 4
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  validates_presence_of :username
  #validates_uniqueness_of :username

  def initialize(user)
    @user = user
  end

  def verify_original_password

  end

  def change_password

  end

  def persisted?
    false
  end

  def generate_token
    #begin

    #end while User.exists?(token token)
  end
end