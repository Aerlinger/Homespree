require 'spec_helper'

describe Mailinglist do

  it { should respond_to :notes }
  it { should respond_to :email }
  it { should respond_to :user_type }

  describe "with valid params" do

    before do
      subject.email = "test@test.com"
      subject.user_type = "CONTRACTOR"
    end

    it { should be_valid }
    it { should_not be_persisted }

    it "should save to contractor" do
      subject.save!

      subject.should be_contractor
    end

    describe "when setting user_type to anythin other than contractor" do

      before do
        subject.user_type = "h"
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
