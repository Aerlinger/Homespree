require "spec_helper"

describe Message do

  it { should respond_to :deliver }

  it { should respond_to :attachment }
  it { should validate_presence_of :sender }

end