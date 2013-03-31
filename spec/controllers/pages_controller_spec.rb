require 'spec_helper'

describe StaticPagesController do

  it "should respond to '/home'" do
    get 'home'
    response.should be_success
  end

  it "should respond to '/homeowners'" do
    get 'homeowners'
    response.should be_success
  end

  it "should respond to '/contractors'" do
    get 'contractors'
    response.should be_success
  end

  it "should respond to '/about'" do
    get 'about'
    response.should be_success
  end
  it "should respond to 'contact'" do
    get 'contact'
    response.should be_success
  end
  it "should respond to 'jobs'" do
    get 'jobs'
    response.should be_success
  end


end
