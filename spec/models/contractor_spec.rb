require 'spec_helper'

describe Contractor do

  it { should respond_to :name }
  it { should respond_to :number }
  it { should respond_to :description }
  it { should respond_to :website }
  it { should respond_to :facebook }
  it { should respond_to :twitter }
  it { should respond_to :specialties }
  it { should respond_to :pictures }

end
