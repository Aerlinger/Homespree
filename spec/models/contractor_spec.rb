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
#  portrait_url           :string(255)      default("/assets/images/contractor_profiles/portrait_default.jpg")
#  logo_url               :string(255)      default("/assets/images/contractor_profiles/logo_default.jpg")
#  notification_settings  :text
#

require 'spec_helper'

describe Contractor do

  let(:contractor) { FactoryGirl.create :contractor }
  before { @photo_attributes = {"0" => {:image_url => "photo1", :caption => "some_caption"}, "1" => {:image_url => "photo1", :caption => "some_caption"}} }
  subject { contractor }

  # Associations
  it { should have_many :alerts }

  it { should respond_to :address }
  it { should respond_to :appointments }
  it { should respond_to :homeowners }
  it { should respond_to :projects }
  it { should respond_to :profile_picture }
  it { should respond_to :badges }
  it { should respond_to :alerts }
  it { should respond_to :photos }
  it { should respond_to :project_photos }
  it { should respond_to :specialties }

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
  it { should respond_to :updated_at }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :logo_url }
  it { should respond_to :portrait_url }

  # Mailboxer Methods:
  it { should respond_to :mailbox }
  it { should respond_to :mark_as_read }
  it { should respond_to :mark_as_unread }
  it { should respond_to :notify }
  it { should respond_to :send_message }
  it { should respond_to :reply_to_all }
  it { should respond_to :reply }
  it { should respond_to :reply_to_conversation }
  it { should respond_to :reply_to_sender }
  it { should respond_to :search_messages }
  it { should respond_to :trash }
  it { should respond_to :untrash }

  # Devise Columns:
  it { should respond_to :sign_in_count }
  it { should respond_to :reset_password_sent_at }
  it { should respond_to :reset_password_token }
  it { should respond_to :last_sign_in_at }
  it { should respond_to :last_sign_in_ip }
  it { should respond_to :encrypted_password }

  describe "defaults" do
    its(:slug) { should eq "joe-s-plumbing" }

    its(:first_name) { should eq "Joe" }
    its(:last_name) { should eq "ThePlumber" }
    its(:name) { should eq "Joe Theplumber" }
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

    it "should have one default photo" do
      contractor.photos.count.should eq 1
    end

  end

  describe "Mailboxer association" do
    subject { contractor.mailbox }

    it { should respond_to :conversations }
    it { should respond_to :inbox }
    it { should respond_to :sentbox }
    it { should respond_to :trash }
  end

  describe "default images" do

    it do
      contractor.logo_url.to_s.should eq ""
    end

    it do
      contractor.portrait_url.to_s.should eq "/assets/contractor_profiles/portrait_default.jpg"
    end

    describe "has a single portrait url by default" do
      let(:photos) { contractor.photos }

      it "has a single photo" do
        photos.length.should eq 1
      end

      it "is the default" do
        photos.first.image_url.should eq "/assets/contractor_profiles/portfolio_images/default.png"
      end
    end
  end

  describe "sanitize phone numbers" do
    before do
      contractor.mobile_number = '[808]389-1234'
      contractor.office_number = '(808)   555-1234'
      contractor.save
    end

    it { should be_valid }
    its(:mobile_number) { should eq '8083891234' }
    its(:office_number) { should eq '8085551234' }
  end

  describe "only requires email, company title, and password" do
    let(:contractor) { Contractor.new }
    subject { contractor }
    before { contractor.valid? }

    it { should_not be_valid }
    it { should_not be_persisted }

    it "email error includes" do
      contractor.errors[:email].should include("can't be blank")
      contractor.errors[:email].should include("is invalid")
    end

    it "company_title error includes" do
      contractor.errors[:company_title].should include("can't be blank")
    end

    it "password error includes" do
      contractor.errors[:password].should include("can't be blank")
    end

    it "is valid once an email, company title are present" do
      contractor.email = "asdf@asdf.com"
      contractor.password = "iamsecret"
      contractor.company_title = "iamsecret"

      contractor.should be_valid
    end
  end

  it "is invalid with duplicate email address" do
    contractor = create :contractor
    duplicate_contractor = build :contractor, email: contractor.email
    duplicate_contractor.valid?

    duplicate_contractor.errors[:email].should include("has already been taken")
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
      contractor.email.should_not be_empty
    end

    it "has name" do
      contractor.first_name.should_not be_empty
      contractor.last_name.should_not be_empty
    end

    it "capitalizes first and last name" do
      contractor.first_name = "joe"
      contractor.last_name = "schmoe"

      contractor.save

      contractor.first_name.should eq "Joe"
    end


    it "downcases email" do
      contractor.email = "JoEtHEplumBEr@Lol.CoM"
      contractor.save
      contractor.email.should eq "joetheplumber@lol.com"
    end

    describe "and invalidate him" do
      it "throws error when there is an invalid email" do
        contractor.email = "joseph"
        contractor.should_not be_valid
      end

      it "throws error there is an absent email" do
        contractor.email = ""
        contractor.should_not be_valid

        contractor.email = nil
        contractor.should_not be_valid
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

  describe "receives a message from admin after being created" do
    it "one message" do
      contractor.mailbox.conversations.count.should eq 1
    end

    it "is from Admin"
  end


end
