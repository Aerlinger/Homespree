require 'spec_helper'

describe Contractor do

  it { should respond_to :addresses }
  it { should respond_to :appointments }

  it { should respond_to :id }
  it { should respond_to :name }
  it { should respond_to :title }
  it { should respond_to :last_name }
  it { should respond_to :mobile_number }
  it { should respond_to :office_number }
  it { should respond_to :description }
  it { should respond_to :website }
  it { should respond_to :facebook }
  it { should respond_to :twitter }
  it { should respond_to :specialties }
  it { should respond_to :pictures }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :updated_at }

  # Devise:
  it { should respond_to :sign_in_count }
  it { should respond_to :reset_password_sent_at }
  it { should respond_to :reset_password_token }
  it { should respond_to :last_sign_in_at }
  it { should respond_to :last_sign_in_ip }
  it { should respond_to :encrypted_password }



  describe "should be invalid" do
    specify "with blank emal" do
      subject.should_not be_valid
    end

    specify "with bad email address" do
      subject.email = "asdf"
      subject.should_not be_valid
    end

    specify "with bad number" do
    end
  end

  describe "Joe The Contractor example" do
    before do
      @joe = Contractor.new
      @joe.email = "joe@joesplumbing.com"
      @joe.password = "iamsecret"
      @joe.password_confirmation = "iamsecret"
    end

    subject { @joe }

    it { should be_valid }

    it "should list incomplete sections" do
      @joe.incomplete_sections.should == [:name, :title, :specialties, :addresses, :mobile_number, :office_number, :website, :facebook, :twitter]

      @joe.name = "joe"
      @joe.incomplete_sections == [:title, :specialties, :addresses, :mobile_number, :office_number, :website, :facebook, :twitter]
    end

    it "should capitalize first and last name" do
      @joe.last_name = "schmoe"

      @joe.save

      @joe.name = "Joe"
      @joe.last_name = "Schmoe"
    end

    it "should downcase email" do
      @joe.email = "JoEtHEplumBEr@Lol.CoM"

      @joe.save

      @joe.email.should eq "joetheplumber@lol.com"
    end

  end

  describe "Create Invalid contractor" do
    before do
      @joe = Contractor.new
      @joe.email = "joe@joe.com"
      @joe.password = "iamsecret"
      @joe.password_confirmation = "iamsecret"
    end

    it "should initially be in a valid state" do
      @joe.should be_valid
    end

    it "should error there is an invalid email" do
      @joe.email = "joseph"
      @joe.should_not be_valid
    end


    it "should error there is an absent email" do
      @joe.email = ""
      @joe.should_not be_valid

      @joe.email = nil
      @joe.should_not be_valid
    end

    it "should error when there are non-matching passwords" do
      @joe.password = "iamsecret"
      @joe.password = "secretiam"

      @joe.should_not be_valid
    end
  end

end
