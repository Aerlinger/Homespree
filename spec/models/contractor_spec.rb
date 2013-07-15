# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  type                   :string(255)
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
#  disabled               :boolean          default(FALSE)
#

require 'spec_helper'

describe Contractor do

  let(:admin) { FactoryGirl.create :contractor, email: "admin@myhomespree.com" }
  let(:contractor) { FactoryGirl.create :contractor }
  before { @photo_attributes = { "0" => { :image_url => "photo1", :caption => "some_caption" }, "1" => { :image_url => "photo1", :caption => "some_caption" } } }
  subject { contractor }

  # Associations
  context "Associations" do
    it { should have_one :address }
    it { should have_many :alerts }
    it { should have_many :appointments }
    it { should have_many :homeowners }
    it { should have_many :projects }
    it { should have_many :badges }
  end

  context "Profile related params" do
    it { should respond_to :profile_picture }
    it { should respond_to :alerts }
    it { should respond_to :photos }
    it { should respond_to :project_photos }
    it { should respond_to :specialties }
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
  end

  # Mailboxer Methods:
  context "mailboxer methods" do
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
  end

  # Devise Columns:
  context "Devise attributes" do
    it { should respond_to :sign_in_count }
    it { should respond_to :reset_password_sent_at }
    it { should respond_to :reset_password_token }
    it { should respond_to :last_sign_in_at }
    it { should respond_to :last_sign_in_ip }
    it { should respond_to :encrypted_password }
  end

  it { should be_contractor }
  its(:class) { should eq Contractor }

  context "default assignments" do
    its(:slug) { should eq "joe-s-plumbing" }
    its(:name) { should eq "Joe Theplumber" }

    its(:office_number) { should eq "8485558443" }
    its(:mobile_number) { should eq "8485558332" }
  end

  context "validations" do
    let(:new_contractor) { Contractor.new }
    subject { new_contractor }

    it { should_not be_valid }
    it { should_not be_persisted }

    it { should have(2).errors_on(:email) }
    it { should have(1).errors_on(:company_title) }
    it { should have(1).errors_on(:password) }
  end

  describe "Mailboxer association" do
    subject { contractor.mailbox }

    it { should respond_to :conversations }
    it { should respond_to :inbox }
    it { should respond_to :sentbox }
    it { should respond_to :trash }
  end

  describe "default images" do
    its("logo_url.to_s") { should eq "" }
    its("portrait_url.to_s") { should eq "/assets/contractor_profiles/portrait_default.jpg" }
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

  it "is invalid with duplicate email address" do
    contractor           = create :contractor
    duplicate_contractor = build :contractor, email: contractor.email
    duplicate_contractor.valid?

    duplicate_contractor.errors[:email].should include("has already been taken")
  end

  describe "capitalizes first and last name" do
    before do
      contractor.first_name = "joe"
      contractor.last_name  = "schmoe"

      contractor.save
    end

    its(:first_name) { should eq "Joe" }
    its(:last_name) { should eq "Schmoe" }
  end

  describe "valid contractor" do

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

  describe "receives a welcome message from admin after being created", pending: true do
    before do
      @admin        = FactoryGirl.create(:contractor, email: "admin@myhomespree.com")
      @contractor   = FactoryGirl.create :contractor
      @conversation = @contractor.mailbox.conversations.first
    end

    it "is from Admin" do
      @conversation.last_sender.email.should eq @admin.email
    end
  end

  describe "bans inactive contractor" do
    specify { Contractor.all.should eq [contractor] }
    it "doesn't return inactive contractor in search" do
      contractor.update_attribute(:disabled, true)
      Contractor.all.should_not include(contractor)
    end
  end
end
