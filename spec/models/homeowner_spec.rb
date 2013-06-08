# == Schema Information
#
# Table name: homeowners
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  address_id             :integer
#  photos_id              :integer
#  appointments_id        :integer
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#

require 'spec_helper'

describe Homeowner do
  it { should respond_to :email }

  let(:home_owner) { FactoryGirl.create(:homeowner) }

  it "is valid" do
    home_owner.should be_valid
    home_owner.should be_persisted
  end

  it "can have many appointments" do
    home_owner.appointments << FactoryGirl.create(:appointment)
    home_owner.should be_valid
    home_owner.should be_persisted
  end

end
