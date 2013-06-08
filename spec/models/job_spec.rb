# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Job do

  let(:job) { FactoryGirl.create(:job) }

  it { should respond_to :appointment_id }
  it { should respond_to :category }

end
