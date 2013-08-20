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

  context "correct defaults" do
    its(:notice_type) { should eq "notice" }
    its(:title) { should eq "Alert Title" }
    its(:content) { should eq "Alert Content" }
  end

  describe "Created with contractor" do
    let(:contractor) { FactoryGirl.create :contractor }

    subject { contractor }
    let(:alert2) { FactoryGirl.create :alert }

    before do
      contractor.alerts << alert
    end

    its(:alerts) { should eq [alert] }

    it "can add a new alert" do
      contractor.alerts << alert2
      contractor.alerts.should eq [alert, alert2]
    end

    context "contractor's alert" do
      subject { alert }

      its(:alertable_type) { should eq "User" }
      its(:alertable) { should eq User.find(contractor.id) }
    end
  end

  describe "Created with homeowner" do
    let(:homeowner) { FactoryGirl.create :homeowner }

    before do
      homeowner.alerts << alert
    end

    it "has only one alert" do
      homeowner.alerts.should eq [alert]
    end

    its(:alertable_type) { should eq "User" }
    its(:alertable) { should eq User.find(homeowner.id) }
  end
end
