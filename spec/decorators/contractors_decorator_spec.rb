require 'spec_helper'

describe ContractorDecorator do
  it "should decorate contractors" do
    assigns(:contractor).should be_decorated
  end
end
