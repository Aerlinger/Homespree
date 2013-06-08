require 'spec_helper'

describe Job do

  it { should respond_to :appointment_id }
  it { should respond_to :category }

end
