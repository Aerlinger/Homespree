# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  title             :string(255)
#  description       :text
#  category_id       :integer
#  contractor_id     :integer
#  homeowner_id      :integer
#  properties        :text
#  project_type_id   :integer
#  submission_status :string(255)
#

require 'spec_helper'

describe Project do
  let(:project) { FactoryGirl.create(:project) }
  let(:project_type) { FactoryGirl.create(:project_type) }

  subject { project }

  before do
    project.project_type = project_type
  end

  # Associations
  it { should belong_to :contractor }
  it { should belong_to :homeowner }
  it { should have_many :before_photos }
  it { should have_many :after_photos }
  it { should have_many :appointments }
  it { should respond_to :after_photos }
  it { should respond_to :before_photos }

  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :zipcode }

  it { should be_valid }
  it { should_not be_fully_valid }

  its("project_type.name") { should include "Wallpapering" }
  its(:to_s) { should include "Wallpapering" }

  its("service_type.name") { should include "Painting" }

  describe "stores before and after photos" do
    its(:before_photos) { should be_empty }
    its(:after_photos) { should be_empty }
  end

  describe "with appointment" do
    let(:appointment) { FactoryGirl.create :appointment }
    let(:homeowner) { FactoryGirl.create :homeowner }
    let(:contractor) { FactoryGirl.create :contractor }
    let(:before_photo) { FactoryGirl.create :photo }
    let(:after_photo) { FactoryGirl.create :photo }

    subject { appointment }

    before do
      project.appointments << appointment
      project.before_photos << before_photo
      project.after_photos << after_photo
      homeowner.appointments << appointment
      contractor.appointments << appointment
    end

    it { should be_persisted }

    its(:project) { should eq project }
    its(:contractor) { should eq contractor }
    its(:homeowner) { should eq homeowner }
    its("project.appointments") { should eq [appointment] }

    describe "contractor has projects through" do
      subject { contractor }

      its(:appointments) { should eq [appointment] }
      its(:projects) { should eq [project] }
      its(:projects) { should eq [appointment.project] }
      its(:homeowners) { should eq [homeowner] }
      its(:projects) { should eq homeowner.projects }
      its(:appointments) { should eq homeowner.appointments }
    end

    describe "homeowner has projects through" do
      subject { homeowner }

      its(:appointments) { should eq [appointment] }
      its(:projects) { should eq [project] }
      its(:projects) { should eq [appointment.project] }
      its(:contractors) { should eq [contractor] }
      its(:projects) { should eq contractor.projects }
      its(:appointments) { should eq contractor.appointments }
    end
  end

  describe "serializable" do
    let(:field1) { FactoryGirl.create :project_field }
    let(:field2) { FactoryGirl.create :project_field }
    let(:field3) { FactoryGirl.create :project_field }
    let(:field4) { FactoryGirl.create :project_field }

    subject { project }


    before do
      [field1, field2, field3, field4].each do |field|
        project.project_type.fields << field
      end
      #project.save
    end

    it "doesn't have null fields" do
      field1.to_s.should eq("Window height")
      field2.to_s.should eq("Window height")
      field3.to_s.should eq("Window height")
      field4.to_s.should eq("Window height")
    end

    its("project_type.fields") { should eq [field1, field2, field3, field4] }
    its(:fields) { should eq [field1, field2, field3, field4] }

    it "can modify properties like a hash" do
      project.properties == {}
      project.properties[:some_bullshit] = "foo"
      project.properties[:some_bullshit].should eq "foo"
      project.properties == { some_bullshit: "foo" }
    end

    it "can serialize properties" do
      params = {}
    end

  end

end
