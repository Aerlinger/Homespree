require 'spec_helper'

describe 'Contractor Profile' do

  before :all do
    @contractor = sign_in_user :contractor
  end

  subject { page }

  its(:response) { status.should be 302 }
  its(:current_path) { should eq "/contractors/profile/#{@contractor.id}" }

  it "should render correct view" do
  end

end