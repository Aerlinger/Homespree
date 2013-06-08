# == Schema Information
#
# Table name: specialties
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  endorser_id   :integer
#  contractor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  description   :string(255)
#  position      :integer
#

require 'spec_helper'

describe Specialty do

  it { should respond_to :name }
  it { should respond_to :description }

  describe "belongs to both and endorser and contractor" do
    it { should respond_to :endorser_id }
    it { should respond_to :contractor_id }
  end

end
