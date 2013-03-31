require 'spec_helper'

describe Specialty do

  it { should respond_to :name }
  it { should respond_to :description }

  describe "belongs to both and endorser and contractor" do
    it { should respond_to :endorser_id }
    it { should respond_to :contractor_id }
  end

end
