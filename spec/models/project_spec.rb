# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string(255)
#  description   :text
#  category_id   :integer
#  contractor_id :integer
#  homeowner_id  :integer
#

require 'spec_helper'

describe Project do

  let(:project) { FactoryGirl.create(:project) }
  subject { project }

  # Associations
  it { should belong_to :contractor }
  it { should belong_to :homeowner }
  it { should have_many :before_photos }
  it { should have_many :after_photos }
  it { should have_one :category }
  it { should have_many :appointments }
  it { should respond_to :after_photos }
  it { should respond_to :before_photos }

  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :zipcode }

  # Validations
  it { should validate_presence_of :category_name }

  it { should be_valid }

  describe "has correct defaults" do
    its(:title) { should eq "My painting project" }
    its(:description) { should eq "This is a test description of the project to be done" }

    it "has a category for painting" do
      project.category.name == "Painting"
    end

    its(:appointments) { should be_empty }
  end

  describe "stores photos" do
    specify "before a project is done" do
      project.before_photos.should be_empty
    end

    specify "after a project is done" do
      project.after_photos.should be_empty
    end
  end

  describe "with appointment" do
    let(:appointment) { FactoryGirl.create :appointment }
    let(:homeowner) { FactoryGirl.create :homeowner }
    let(:contractor) { FactoryGirl.create :contractor }
    let(:before_photo) { FactoryGirl.create :photo }
    let(:after_photo) { FactoryGirl.create :photo }

    before do
      project.appointments << appointment
      project.before_photos << before_photo
      project.after_photos << after_photo
      homeowner.appointments << appointment
      contractor.appointments << appointment
    end

    subject { appointment }

    it { should be_valid }

    specify { appointment.project.should eq project }

    specify "project belongs to appointment" do
      project.appointments.should eq [appointment]
    end

    specify { Appointment.count.should eq 1 }


    describe "contractor has projects through" do

      it "has one appointment" do
        contractor.appointments.should eq [appointment]
      end

      it "has one project" do
        contractor.projects.should eq [project]
      end

      specify "appointment belongs to contractor" do
        appointment.contractor.should eq contractor
      end

      it "creates a project for the appointment" do
        contractor.projects.should eq [appointment.project]
      end

      it "has one homeowner" do
        contractor.homeowners.should eq [homeowner]
      end

      it "has same projects as homeowner" do
        contractor.projects.should eq homeowner.projects
      end


      it "has same appointments as homeowner" do
        contractor.appointments.should eq homeowner.appointments
      end

    end

    describe "homeowner has projects through" do

      specify "appointment belongs to homeowner" do
        appointment.homeowner.should eq homeowner
      end

      it "has one appointment" do
        homeowner.appointments.should eq [appointment]
      end

      it "has one project" do
        homeowner.projects.should eq [project]
      end

      it "has one contractor" do
        homeowner.contractors.should eq [contractor]
      end

      it "creates a project for an appointments" do
        homeowner.projects.should eq contractor.projects
      end

      it "has same appointments as contractor" do
        homeowner.appointments.should eq contractor.appointments
      end

    end
  end

end
