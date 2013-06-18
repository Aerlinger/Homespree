# == Schema Information
#
# Table name: jobs
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  title          :string(255)
#  description    :text(255)
#  category_id    :integer
#  appointment_id :integer
#

require 'spec_helper'

describe Job do

  let(:job) { FactoryGirl.create(:job) }
  subject { job }

  it { should respond_to :appointments }
  it { should respond_to :categories }
  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :zipcode }
  it { should respond_to :after_photos }
  it { should respond_to :before_photos }

  it { should be_valid }

  describe "has correct defaults" do
    its(:title) { should eq "Job name" }
    its(:description) {  should eq "This is a test description of the job to be done" }
  end

  describe "stores photos" do
    specify "before a job is done" do
      job.before_photos.should be_empty
    end

    specify "after a job is done" do
      job.after_photos.should be_empty
    end
  end

  describe "contractor has jobs through appointments" do
    let(:contractor) { FactoryGirl.create :contractor }
    let(:appointment) { FactoryGirl.create :appointment }

    it "is persisted" do
      contractor.should be_persisted
    end

    it "creates a job" do
      contractor.jobs.should eq [job]
    end

  end

  describe "homeowner has jobs through appointments" do
    let(:homeowner) { FactoryGirl.create :homeowner }

    it "is persisted" do
  
    end


  end

end
