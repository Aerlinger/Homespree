require 'spec_helper'

describe Photo do
  it { should respond_to :filename }
  it { should respond_to :caption }
  it { should respond_to :name }
end
