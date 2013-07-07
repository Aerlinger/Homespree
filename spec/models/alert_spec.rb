require 'spec_helper'

# == Schema Information
#
# Table name: alerts
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  content        :text
#  alertable_id   :integer
#  alertable_type :string(255)
#  notice_type    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

describe Alert do

  let(:alert) { FactoryGirl.create :alert }

  subject { alert }

  # Associations
  it { should respond_to :alertable }

  # Instance methods
  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :alertable_id }
  it { should respond_to :alertable_type }
  it { should respond_to :notice_type }

  it { should be_valid }

  describe "correct defaults" do
    its(:notice_type) { should eq "notice" }
    its(:title) { should eq "Alert Title" }
    its(:content) { should eq "Alert Content" }
  end

  describe "Created with contractor" do
    let(:contractor) { FactoryGirl.create :contractor }
    before do
      contractor.alerts << alert
    end

    it "persists" do
      contractor.should be_persisted
      contractor.should be_valid
    end

    it "has only one alert" do
      contractor.alerts.should eq [alert]
    end

    it "can add a new alert" do
      contractor.alerts << alert
      contractor.alerts.should eq [alert, alert]
    end

    specify "alert has correct type" do
      alert.alertable_type.should eq "User"
    end

    specify "alert maintains reference to contractor" do
      alert.alertable.should eq User.find(contractor.id)
    end

  end

  describe "Created with homeowner" do
    let(:homeowner) { FactoryGirl.create :homeowner }
    before do
      homeowner.alerts << alert
    end

    it "persists" do
      homeowner.should be_persisted
      homeowner.should be_valid
    end

    it "has only one alert" do
      homeowner.alerts.should eq [alert]
    end

    specify "alert has correct type" do
      alert.alertable_type.should eq "User"
    end

    specify "alert maintains reference to homeowner" do
      alert.alertable.should eq User.find(homeowner.id)
    end
  end

end
