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

  context "table attributes" do
    it { should respond_to :name }
    it { should respond_to :project_types }
    it { should respond_to :created_at }
    it { should respond_to :updated_at }
    it { should respond_to :params }
  end

  #it { should validate_uniqueness_of :name }
  #it { should validate_presence_of :name }

  its(:project_types) { should be_empty }

  its(:to_s) { should include "Painting" }
  its(:to_s) { should include "Painting" }


  describe "with project types as children" do
    let(:project_type) { FactoryGirl.create :project_type }
    before { service_type.project_types << project_type }

    its(:project_types) { should eq [project_type] }

    describe "can add another subcategory" do
      let(:another_project_type) { FactoryGirl.create :project_type }
      before do
      service_type.project_types << another_project_type
      end

      its(:project_types) { should == [project_type, another_project_type] }
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
