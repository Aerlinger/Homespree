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
  it { should respond_to :categories }


  it "should build an association for appointment do" do
    job.appointment.should_not be_nil
  end

  its(:title) { should be "Job Title"}
  its(:description) { should be "This is a test description of the job to be done"}

  describe "stores photos" do
    specify "before a job is done" do
      jobs.before_photos.should_not be_nil
    end

    specify "after a job is done" do
      jobs.after_photos.should_not be_nil
    end

  end

end