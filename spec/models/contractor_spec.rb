# == Schema Information
#
# Table name: contractors
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  description            :text
#  specialties            :text
#  website                :string(255)
#  facebook               :string(255)
#  twitter                :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  pictures               :text
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
#  insurance_limit        :decimal(5, 2)
#  bonding_limit          :decimal(5, 2)
#  photo_filename         :string(255)
#  slogan                 :text
#  new_profile            :boolean          default(FALSE)
#  years_experience       :decimal(, )
#  latitude               :float
#  longitude              :float
#  availability_radius    :decimal(, )
#  logo                   :string(255)
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  authentication_token   :string(255)
#

require 'spec_helper'

describe Contractor do

  let(:mike) { FactoryGirl.create :contractor }
  subject { mike }

  it { should respond_to :address }
  it { should respond_to :appointments }

  it { should respond_to :id }
  it { should respond_to :company_title }
  it { should respond_to :first_name }
  it { should respond_to :last_name }
  it { should respond_to :mobile_number }
  it { should respond_to :office_number }
  it { should respond_to :description }
  it { should respond_to :website }
  it { should respond_to :facebook }
  it { should respond_to :twitter }
  it { should respond_to :specialties }
  it { should respond_to :pictures }
  it { should respond_to :updated_at }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }

  # Devise Columns:
  it { should respond_to :sign_in_count }
  it { should respond_to :reset_password_sent_at }
  it { should respond_to :reset_password_token }
  it { should respond_to :last_sign_in_at }
  it { should respond_to :last_sign_in_ip }
  it { should respond_to :encrypted_password }

  it "has one address" do
    mike.address.should_not be_nil
  end

  it "has many photos"
  it "has many messages"
  it "has many jobs"
  it "has many appointments"
  it "has many homeowners through appointments"


  describe "sanitize phone numbers" do
    before do
      mike.mobile_number = '[808]389-1234'
      mike.office_number = '(808)   555-1234'
      mike.save
    end

    it { should be_valid }
    its(:mobile_number) { should eq '8083891234' }
    its(:office_number) { should eq '8085551234' }
  end

  describe "with nothing" do
    before do
      @contractor = Contractor.new
    end
  end

  it "is invalid with duplicate email address" do
    contractor = create :contractor
    duplicate_contractor = build :contractor, email: contractor.email

    expect(duplicate_contractor).to have(2).errors_on(:email)
  end

  describe "valid contractor" do
    it "checks phone numbers" do
      [:office_number, :mobile_number].each do |number|
        subject[number] = "123456789"
        subject.should_not be_valid
        expect(subject.errors.messages[number]).to eq ["must be valid"]
      end
    end

    it "has email" do
      mike.email.should_not be_empty
    end

    it "has name" do
      mike.first_name.should_not be_empty
      mike.last_name.should_not be_empty
    end

    it "capitalizes first and last name" do
      mike.first_name = "joe"
      mike.last_name = "schmoe"

      mike.save

      mike.first_name.should eq "Joe"
      mike.last_name.should eq "Schmoe"
    end

    it "downcases email" do
      mike.email = "JoEtHEplumBEr@Lol.CoM"
      mike.save
      mike.email.should eq "joetheplumber@lol.com"
    end

    describe "and invalidate him" do
      it "throws error when there is an invalid email" do
        mike.email = "joseph"
        mike.should_not be_valid
      end

      it "throws error there is an absent email" do
        mike.email = ""
        mike.should_not be_valid

        mike.email = nil
        mike.should_not be_valid
      end

      specify "with blank email" do
        mike.email = ""
        mike.should_not be_valid
      end

      specify "with bad email address" do
        subject.email = "asdf"
        subject.should_not be_valid
      end

      specify "with phone number of the wrong length" do
        subject.office_number = "01234567890"
        subject.should_not be_valid
        subject.office_number = "123456789"
        subject.should_not be_valid
      end
    end

  end

  describe "Joe The Contractor example" do

    let(:new_guy) { Contractor.new }

    subject { new_guy }

    it { should_not be_valid }

    it "should list incomplete sections" do
      incomplete_sections = [:first_name, :last_name, :company_title, :specialties, :mobile_number, :office_number, :slogan, :description, :address]
      new_guy.incomplete_sections.should == incomplete_sections

      new_guy.first_name = "joe"
      new_guy.incomplete_sections == incomplete_sections - [:first_name]
    end

    it "should show error for non existent password" do
      new_guy.valid?
      new_guy.errors[:company_title].should eq ["can't be blank"]
    end
  end

  describe "should build a full contractor" do
    let(:plumber) { FactoryGirl.build(:contractor) }

    subject {plumber}

    it { should be_valid }

    its(:first_name) { should eq "Joe" }
    its(:last_name) { should eq "Theplumber" }
    its(:company_title) { should eq "Joe's Plumbing" }

    its(:license) { should eq "ABCDEFG12345" }
    its(:insurance_limit) { should eq 200000.0 }
    its(:bonding_limit) { should eq 100000.0 }

    its(:office_number) { should eq "8485558443" }
    its(:mobile_number) { should eq "8485558332" }

    its(:slogan) { should eq "I am Joe the plumber" }

    its(:facebook) { should eq "www.facebook.com/joe_the_plumber" }
    its(:twitter) { should eq "@joe_the_plumber" }
    its(:website) { should eq "http://www.joesplumbing.com" }
  end
end
