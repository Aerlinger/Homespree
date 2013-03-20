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

  describe "valid contractor" do
    before { @contractor = create :contractor }

    it "should check phone numbers" do
      [:office_number, :mobile_number].each do |number|
        @contractor[number] = "123456789"
        @contractor.should_not be_valid
        expect(@contractor.errors.messages[number]).to eq ["is invalid"]
      end
    end

    it "should have email" do
      @contractor.email.should_not be_empty
    end

    it "should have name" do
      @contractor.first_name.should_not be_empty
      @contractor.last_name.should_not be_empty
    end

  end

  describe "Joe The Contractor example" do
    before do
      @joe = create :contractor
    end

    subject { @joe }

    it { should be_valid }

    it "should list incomplete sections" do
      incomplete_sections = [:title, :specialties, :mobile_number, :office_number, :addresses, :website, :facebook, :twitter]
      @joe.incomplete_sections.should == incomplete_sections

      @joe.first_name = "joe"
      @joe.incomplete_sections == incomplete_sections - [:first_name]
    end

    it "should capitalize first and last name" do
      @joe.first_name = "joe"
      @joe.last_name = "schmoe"

      @joe.save

      @joe.first_name.should eq "Joe"
      @joe.last_name.should eq "Schmoe"
    end

    it "should downcase email" do
      @joe.email = "JoEtHEplumBEr@Lol.CoM"
      @joe.save
      @joe.email.should eq "joetheplumber@lol.com"
    end


    describe "and invalidate him" do

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

    end

  end


end
