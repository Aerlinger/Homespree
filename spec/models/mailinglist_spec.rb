require 'spec_helper'

describe Mailinglist do

  it { should respond_to :notes }
  it { should respond_to :email }
  it { should respond_to :user_type }

  it "should create entry" do
    expect { Mailinglist.create!(email: "iamatest@rspec.com", user_type: :contractor) }.to change{Mailinglist.count}.by 1
  end

  describe "with valid params" do

    before do
      subject.email = "test@rspec.com"
      subject.user_type = "CONTRACTOR"
      subject.save!
    end

    it { should be_valid }
    it { should be_persisted }

    it "should save to contractor" do
      subject.should be_contractor
    end

    it "should be able to destroy a contractor" do
      mailinglist = Mailinglist.find_by_email("test@rspec.com")
      expect{ mailinglist.destroy }.to change{Mailinglist.count}.by(-1)
    end

    describe "when setting user_type to anything other than contractor" do

      before do
        subject.user_type = "h"
        subject.save
      end

      it { should_not be_contractor }

    end

  end

  describe "with empty params" do
    before do
      subject.email = "test@test.com"
      subject.user_type = ""
    end

    it { should_not be_valid }

    describe "and save" do

      before do
        subject.save
      end

      it { should_not be_persisted }
    end
  end

  describe "with invalid email" do
    before do
      subject.email = "test@test.c"
      subject.user_type = "homeowner"
      subject.save
    end

    it { should_not be_valid }
  end



end
