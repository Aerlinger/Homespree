require 'spec_helper'

describe "Landing Page" do

  subject { page }
  before { visit root_path }


  describe "layout" do
    it { should have_selector("div") }

    its "footer" do

    end

    its "email submission box" do

    end
  end

end