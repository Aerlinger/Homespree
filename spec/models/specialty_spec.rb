require 'spec_helper'

describe Specialty do

  it { should respond_to :name }
  it { should respond_to :endorser_id }
  it { should respond_to :contractor_id }

end
