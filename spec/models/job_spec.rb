# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string(255)
#  description :string(255)
#  category_id :integer
#

require 'spec_helper'

describe Job do

  let(:job) { FactoryGirl.create(:job) }
  subject { job }

  it { should respond_to :appointment_id }
  it { should respond_to :appointment }


  it "should build an association for appointment do" do
    job.appointment.should_not be_nil
  end

  its(:title) { should be "Job name"}
  its(:description) { should eq "This is a test description of the job to be done"}

  describe "stores photos" do
    specify "before a job is done" do
      job.before_photos.should_not be_nil
    end

    specify "after a job is done" do
      job.after_photos.should_not be_nil
    end

  end

end