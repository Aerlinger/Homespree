require 'spec_helper'

describe Contractor do

  it { should respond_to :addresses }
  it { should respond_to :appointments }

  it { should respond_to :id }
  it { should respond_to :name }
  it { should respond_to :title }
  it { should respond_to :last_name }
  it { should respond_to :number }
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
      @joe.incomplete_sections.should == [:name, :title, :specialties, :addresses, :number, :website, :facebook, :twitter]

      @joe.name = "joe"
      @joe.incomplete_sections == [:title, :specialties, :addresses, :number, :website, :facebook, :twitter]
    end

  end

  describe "Create Invalid contractor" do
    before do
      @joe = Contractor.new
      @joe.email = "joe@joespmbing.com"
      @joe.password = "iamsecret"
      @joe.password_confirmation = "iamsecret"
    end
  end

end
