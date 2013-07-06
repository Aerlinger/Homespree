# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  user_type              :string(255)
#  first_name             :string(255)
#  description            :text
#  specialties            :text
#  website                :string(255)
#  facebook               :string(255)
#  twitter                :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      not null
#  last_name              :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  company_title          :string(255)
#  mobile_number          :string(255)
#  office_number          :string(255)
#  license                :string(255)
#  insurance_limit        :integer
#  bonding_limit          :integer
#  photo_filename         :string(255)
#  slogan                 :text
#  years_experience       :integer
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  authentication_token   :string(255)
#  edited                 :boolean          default(FALSE)
#  hourly_rate            :integer
#  slug                   :string(255)
#  portrait_url           :string(255)
#  logo_url               :string(255)
#  notification_settings  :text
#  guest                  :boolean
#

require 'spec_helper'

describe Homeowner do
  it { should respond_to :email }

  let(:homeowner) { FactoryGirl.create(:homeowner) }

  # Associations
  it { should have_one :address }
  it { should have_many :alerts }
  it { should have_many :appointments }
  it { should have_many :projects }
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
  specify { Homeowner.should respond_to :new_homeowner_guest }

  it "titlieizes name" do
    ho = FactoryGirl.create(:homeowner, first_name: "betty", last_name: "boop")
    ho.first_name.should eq "Betty"
    ho.last_name.should eq "Boop"
  end

  it "can be queried for its type type" do
    homeowner.should be_homeowner
  end

  it "is a Homeowner class object" do
    homeowner.class.should eq Homeowner
  end

  it "can be created as a guest" do
    guest_homeowner = Homeowner.new_homeowner_guest
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

  it "not valid with too short of a password" do
    homeowner.password = 'secre'
    homeowner.save
    homeowner.errors.keys.should include(:password)
  end


  context "Guest User" do
    let(:guest_homeowner) { Homeowner.create_guest }
    subject { guest_homeowner }

    it { should be_guest }

    its(:first_name) { should eq "Guest homeowner" }

    describe "Creating a project and upgrading account" do
      let(:project) { FactoryGirl.build :project }
      let(:appointment) { FactoryGirl.create(:appointment) }

      before do
        project.appointments << appointment
        guest_homeowner.projects << project
      end

      it "upgrades to guest homeowner when a password is given" do
        guest_homeowner.email    = "homeowner@home.com"
        guest_homeowner.password = "iamsecret"
        guest_homeowner.save
        guest_homeowner.should_not be_guest
      end
    end
  end

  # Mocks and Stubs:  ----------------------------------------------------------------------------------------------

  context "Validations" do

    let(:badge) { stub(name: 'early_adopter') }

    it "before validation" do
      homeowner.should_receive(:sanitize_phone_numbers)
      homeowner.save
    end

  end


end
