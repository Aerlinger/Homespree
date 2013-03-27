require 'spec_helper'

describe Contractor do

  it { should respond_to :addresses }
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

  let(:mike) { FactoryGirl.create :contractor }
  subject { mike }


  describe "sanitize phone numbers" do
    before do
      mike.office_number = '(808)   389-1234'
      mike.mobile_number = '[808]389-1234'
      mike.valid?
    end

    it { should be_valid }
    its(:office_number) { should eq "8083891234" }
    its(:mobile_number) { should eq "8083891234" }
  end


  describe "with nothing" do
    before do
      @contractor = Contractor.new
      @contractor.save
    end

    it { @contractor.should_not be_valid }

    it "should show error for non existent password" do
      @contractor.errors.messages[:password].should eq ["can't be blank"]
      @contractor.errors.messages[:email].should eq ["can't be blank", "is invalid"]
      @contractor.errors.messages[:company_title].should eq ["must include either a title or first and last name"]
    end
  end


  describe "valid contractor" do

    it "should check phone numbers" do
      [:office_number, :mobile_number].each do |number|
        subject[number] = "123456789"
        subject.should_not be_valid
        expect(subject.errors.messages[number]).to eq ["must be valid"]
      end
    end

    it "should have email" do
      mike.email.should_not be_empty
    end

    it "should have name" do
      mike.first_name.should_not be_empty
      mike.last_name.should_not be_empty
    end

    it "should capitalize first and last name" do
      mike.first_name = "joe"
      mike.last_name = "schmoe"

      mike.save

      mike.first_name.should eq "Joe"
      mike.last_name.should eq "Schmoe"
    end

    it "should downcase email" do
      mike.email = "JoEtHEplumBEr@Lol.CoM"
      mike.save
      mike.email.should eq "joetheplumber@lol.com"
    end

    describe "and invalidate him" do
      it "should error there is an invalid email" do
        mike.email = "joseph"
        mike.should_not be_valid
      end

      it "should error there is an absent email" do
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
    before do
      @mike = Contractor.new
    end

    subject { @mike }

    it { should_not be_valid }

    it "should list incomplete sections" do
      incomplete_sections = [:first_name, :last_name, :company_title, :specialties, :mobile_number, :office_number, :slogan, :description, :addresses]
      @mike.incomplete_sections.should == incomplete_sections

      @mike.first_name = "joe"
      @mike.incomplete_sections == incomplete_sections - [:first_name]
    end
  end

  describe "should build a full contractor" do
    before do
      @plumber = Contractor.new do |c|

        c.email = "joetheplumber@seed.com"
        c.password = "iamsecret"

        c.id = 1
        c.first_name = "joe"
        c.last_name = "thePlumber"
        c.company_title = "Joe's Plumbing"

        c.bonding_limit = 100.00
        c.insurance_limit = 200.00

        c.office_number = "714-555-9652"
        c.mobile_number = "949-555-6404"

        c.slogan = "I am Joe the plumber"

        c.description = Faker::Lorem.paragraphs(5).join

        c.facebook = "www.facebook.com/joe_the_plumber"
        c.twitter = "@joe_the_plumber"
        c.license = "abcdefg12345"

        c.website = "http://www.joesplumbing.com"

        address = Address.new do |a|
          a.line1 = "1234 Blue collar road"
          a.line2 = "4th Main Providence"
          a.state = "nj"
          a.zipcode = "12345"
          a.city = "princeton"
        end

        c.addresses << address
      end

      @plumber.save!
    end

    subject {@plumber}

    it { should be_valid }

    its(:first_name) { should eq "Joe" }
    its(:last_name) { should eq "ThePlumber" }
    its(:company_title) { should eq "Joe's Plumbing" }

    its(:bonding_limit) { should eq 100.00 }
    its(:insurance_limit) { should eq 200.00 }

    its(:office_number) { should eq "7145559652" }
    its(:mobile_number) { should eq "9495556404" }

    its(:slogan) { should eq "I am Joe the plumber" }

    its(:facebook) { should eq "www.facebook.com/joe_the_plumber" }
    its(:twitter) { should eq "@joe_the_plumber" }
    its(:license) { should eq "abcdefg12345" }
    its(:website) { should eq "http://www.joesplumbing.com" }

  end
end
