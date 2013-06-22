# == Schema Information
#
# Table name: badges
#
#  id            :integer          not null, primary key
#  contractor_id :integer
#  name          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :text
#  image_url     :string(255)
#

require 'spec_helper'

describe Badge do

  let(:badge) { FactoryGirl.create :badge }
  subject { badge }


  # Associations
  it { should belong_to :contractor }
  it { should respond_to :contractor_id }
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :image_url }


  its(:name) { should eq "early_adopter" }

end
