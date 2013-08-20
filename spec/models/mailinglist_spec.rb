# == Schema Information
#
# Table name: mailinglists
#
#  id                    :integer          not null, primary key
#  email                 :string(255)
#  contractor            :boolean          default(FALSE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  notes                 :text
#  submitted_from_mobile :boolean
#

require 'spec_helper'

describe Mailinglist do
  subject { create :mailinglist }

  it { should respond_to :notes }
  it { should respond_to :email }
  it { should respond_to :user_type }
  it { should be_valid }

  describe "with valid params" do
    it { should be_persisted }

    it "saves to contractor" do
      subject.should be_contractor
    end

    it "is able to destroy a contractor" do
      mailinglist = create :mailinglist
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

  describe "with empty user_type" do
    before do
      subject.email = "test@test.com"
      subject.user_type = ""
    end

    it { should_not be_valid }
  end

  it "defaults to homeowner if substring does not contain contractor" do
    subject.update_attributes(user_type: "l")
    subject.should_not be_contractor
  end

  describe "with invalid email" do
    before do
      subject.email = "test@test.c"
      subject.user_type = "homeowner"
    end

    it { should_not be_valid }
  end

end
