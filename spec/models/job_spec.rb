# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)
#  description :text(255)
#  category_id :integer
#

require 'spec_helper'

describe Job do

  let(:job) { FactoryGirl.create(:job) }
  subject { job }

  # Associations
  it { should belong_to :contractor }
  it { should belong_to :homeowner }
  it { should have_many :before_photos }
  it { should have_many :after_photos }
  it { should have_many :categories }
  it { should have_many :appointments }
  it { should respond_to :after_photos }
  it { should respond_to :before_photos }

  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :zipcode }

  it { should be_valid }

  describe "has correct defaults" do
    its(:title) { should eq "Job name" }
    its(:description) { should eq "This is a test description of the job to be done" }

    its(:appointments) { should be_empty }
  end

  describe "stores photos" do
    specify "before a job is done" do
      job.before_photos.should be_empty
    end

    specify "after a job is done" do
      job.after_photos.should be_empty
    end
  end

  describe "with appointment" do
    let(:appointment) { FactoryGirl.create :appointment }
    let(:homeowner) { FactoryGirl.create :homeowner }
    let(:contractor) { FactoryGirl.create :contractor }
    let(:before_photo) { FactoryGirl.create :photo }
    let(:after_photo) { FactoryGirl.create :photo }

    before do
      job.appointments << appointment
      job.before_photos << before_photo
      job.after_photos << after_photo
      homeowner.appointments << appointment
      contractor.appointments << appointment
    end

    subject { appointment }

    it { should be_valid }

    specify { appointment.job.should eq job }

    specify "job belongs to appointment" do
      job.appointments.should eq [appointment]
    end

    specify { Appointment.count.should eq 1 }


    describe "contractor has jobs through" do

      it "has one appointment" do
        contractor.appointments.should eq [appointment]
      end

      it "has one job" do
        contractor.jobs.should eq [job]
      end

      specify "appointment belongs to contractor" do
        appointment.contractor.should eq contractor
      end

      it "creates a job for the appointment" do
        contractor.jobs.should eq [appointment.job]
      end

      it "has one homeowner" do
        contractor.homeowners.should eq [homeowner]
      end

      it "has same jobs as homeowner" do
        contractor.jobs.should eq homeowner.jobs
      end


      it "has same appointments as homeowner" do
        contractor.appointments.should eq homeowner.appointments
      end

    end

    describe "homeowner has jobs through" do

      specify "appointment belongs to homeowner" do
        appointment.homeowner.should eq homeowner
      end

      it "has one appointment" do
        homeowner.appointments.should eq [appointment]
      end

      it "has one job" do
        homeowner.jobs.should eq [job]
      end

      it "has one contractor" do
        homeowner.contractors.should eq [contractor]
      end

      it "creates a job for an appointments" do
        homeowner.jobs.should eq contractor.jobs
      end

      it "has same appointments as contractor" do
        homeowner.appointments.should eq contractor.appointments
      end

    end
  end

end
