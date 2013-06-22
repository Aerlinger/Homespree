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

  let(:homeowner) { FactoryGirl.create(:homeowner) }

  # Associations
  it { should have_one :address }
  it { should have_many :alerts }
  it { should have_many :appointments }
  it { should have_many :jobs }
  it { should have_many :contractors }
  it { should have_many :before_photos }
  it { should have_many :after_photos }

  it { should respond_to :guest }

  # Mailboxer Methods:
  it { should respond_to :send_message }
  it { should respond_to :reply_to_all }
  it { should respond_to :reply_to_conversation }
  it { should respond_to :reply_to_sender }

  # Devise Columns:
  it { should respond_to :sign_in_count }
  it { should respond_to :reset_password_sent_at }
  it { should respond_to :reset_password_token }
  it { should respond_to :last_sign_in_at }
  it { should respond_to :last_sign_in_ip }
  it { should respond_to :encrypted_password }

  # Class Methods
  specify { Homeowner.should respond_to :new_guest }

  it "can be created as a guest" do
    guest_homeowner = Homeowner.new_guest
    guest_homeowner.guest.should be_true
  end

  it "is valid" do
    homeowner.should be_valid
    homeowner.should be_persisted
  end

  it "should not be valid without email" do
    homeowner.email = "adf"
    homeowner.should_not be_valid
  end

  it "should not be valid without password" do
    homeowner.password = ''
    homeowner.should_not be_valid
  end

  it "not valid with too short of a password" do
    homeowner.password = 'secre'
    homeowner.should_not be_valid
  end

  it "invalid with different password and confirmation" do
    homeowner.password = "secret"
    homeowner.password_confirmation = "different"
    homeowner.should_not be_valid
  end

end
