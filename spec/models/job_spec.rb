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

  it { should respond_to :appointment_id }
  it { should respond_to :appointment }
  it { should respond_to :categories }

end
