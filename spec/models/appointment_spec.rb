# == Schema Information
#
# Table name: appointments
#
#  id                      :integer          not null, primary key
#  starts_at               :datetime
#  photos                  :string(255)
#  reminders               :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  contractor_id           :integer
#  title                   :string(255)
#  description             :string(255)
#  homeowner_id            :integer
#  duration                :decimal(, )
#  project_id              :integer
#  verified_by_homeowner   :boolean          default(FALSE)
#  verified_by_contractor  :boolean          default(FALSE)
#  completed_by_homeowner  :boolean          default(FALSE)
#  completed_by_contractor :boolean          default(FALSE)
#

require 'spec_helper'

describe Appointment do

  let(:appointment) { FactoryGirl.create :appointment }
  let(:contractor) { FactoryGirl.create :contractor }
  let(:homeowner) { FactoryGirl.create :homeowner }
  let(:project) { FactoryGirl.create :project }
  let(:address) { FactoryGirl.create :address }

  subject { appointment }

  before do
    contractor.appointments << appointment
    homeowner.appointments << appointment
    project.appointments << appointment

    appointment.address = address
    project.save
  end

  # Assocations
  context "associations" do
    it { should have_one :address }
    it { should belong_to :contractor }
    it { should belong_to :homeowner }
    it { should belong_to :project }
  end

  # Validations
  context "validations" do
    it { should validate_presence_of :starts_at }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :address }

    it { should accept_nested_attributes_for :address }
  end

  # Table columns
  context "table columns" do
    it { should respond_to :starts_at }
    it { should respond_to :reminders }
    it { should respond_to :photos }
    it { should respond_to :title }
    it { should respond_to :description }
    it { should respond_to :verified_by_homeowner }
    it { should respond_to :verified_by_contractor }
    it { should respond_to :completed_by_homeowner }
    it { should respond_to :completed_by_contractor }
  end

  its(:contractor) { should eq contractor }
  its(:homeowner) { should eq homeowner }
  its(:project) { should eq project }
  its(:address) { should eq address }

  context "belongs to a contractor" do
    subject { contractor }

    its(:appointments) { should eq(homeowner.appointments) }
    its(:appointments) { should eq [appointment] }
    its(:projects) { should eq [project] }
    its(:projects) { should eq homeowner.projects }
    its(:homeowners) { should eq [homeowner] }
  end

  context "belongs to a homeowner" do
    subject { homeowner }

    its(:appointments) { should eq(contractor.appointments) }
    its(:projects) { should eq [project] }
    its(:projects) { should eq contractor.projects }
    its(:contractors) { should eq [contractor] }
  end

  context "belongs to a project" do
    subject { project }

    it { should be_valid }
  end

  context "has one address" do
    subject { address }

    it { should be_valid }
    its(:city) { should eq appointment.address.city }
    its(:state) { should eq appointment.address.state }
    its(:zipcode) { should eq appointment.address.zipcode }
  end

  describe "create a second appointment for a project" do
    let(:appointment2) { FactoryGirl.create :appointment }

    subject { appointment2 }

    before do
      contractor.appointments << appointment2
      homeowner.appointments << appointment2
      project.appointments << appointment2

      appointment2.address = address
    end

    its(:homeowner) { should eq homeowner }
    its(:contractor) { should eq contractor }

    context "contractor" do
      subject { contractor }

      its(:appointments) { should eq [appointment, appointment2] }
      its(:homeowners) { should eq [homeowner] }
    end

    context "homeowner" do
      subject { homeowner }

      its(:appointments) { should eq [appointment, appointment2] }
      its(:contractors) { should eq [contractor] }
    end
  end

  describe "overlap with another appointment" do
    let(:appointment2) { FactoryGirl.create :appointment }

    subject { appointment2 }

    it { should be_overlaps_with appointment }

    specify "when overlapping by one hour" do
      appointment2.postpone_by(1.hours)
      appointment2.overlaps_with?(appointment).should be_true
    end

    specify "when not overlapping" do
      appointment2.postpone_by(2.22.hours)
      appointment2.overlaps_with?(appointment).should be_false
    end

    specify "when not overlapping before" do
      appointment2.postpone_by(-2.22.hours)
      appointment2.overlaps_with?(appointment).should be_false
    end
  end

end
