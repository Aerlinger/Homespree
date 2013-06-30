# == Schema Information
#
# Table name: service_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  params     :text
#  position   :integer
#

require 'spec_helper'

describe ServiceType do

  let(:service_type) { FactoryGirl.create(:service_type) }
  subject { service_type }

  # Instance methods:
  it { should respond_to :id }
  it { should respond_to :name }
  it { should respond_to :project_types }
  it { should respond_to :created_at }
  it { should respond_to :updated_at }
  it { should respond_to :params }

  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }

  its(:project_types) { should be_empty }

  it "has correct to_s" do
    "#{service_type}".should eq "RspecPainting"
  end

  it "should be valid by default" do
    service_type.should be_valid
  end

  it "is invalid without a name" do
    service_type.name = nil
    service_type.should_not be_valid
  end

  describe "with project types as children" do
    let(:project_type) { FactoryGirl.create :project_type }
    before { service_type.project_types << project_type }

    it "is persisted" do
      service_type.should be_persisted
      service_type.should be_valid
    end

    it "has one job category" do
      service_type.project_types.length.should eq 1
    end

    it "creates a project_types" do
      service_type.project_types.should eq [project_type]
    end

    it "can add another subcategory" do
      another_project_type = FactoryGirl.create :project_type
      service_type.project_types << another_project_type

      service_type.project_types.should == [project_type, another_project_type]
    end

  end

  describe "stores and retrieves params" do

    describe "concrete" do
      before do
        params = {
          location: "Interior",
          desired_finish: "Stain / Coloring",
          dimensions: "Square Feet"
        }
        project_type.params = params
        project_type.save!
      end

      xit "saves location" do
        project_type.params['location'].should eq "Interior"
      end

      xit "saves desired finish" do
        project_type.params['desired_finish'].should eq "Stain / Coloring"
      end

    end

    describe "Deck" do

    end

    describe "Doors" do

    end

    describe "Exterior" do

    end

    describe "Faux Finish" do

    end

    describe "Fence" do

    end

    describe "Interior Painting" do

    end

    describe "Wood Floor Finishing" do

    end

    describe "Powerwashing" do

    end

    describe "Windows" do

    end

  end
end
