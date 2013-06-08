# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  categorizable_id   :integer
#  categorizable_type :string(255)
#

require 'spec_helper'

describe Category, focus: true do

  let(:category) { FactoryGirl.create(:category) }
  subject { category }

  it { should respond_to :name }
  it { should respond_to :subcategories }
  it { should respond_to :categorizable_type }
  it { should respond_to :categorizable_id }

  it "should be valid by default" do
    category.should be_valid
  end

end
