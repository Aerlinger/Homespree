require 'spec_helper'

describe "Homeowner profile" do

  describe "When not signed in" do
    it "should render contratcor profile" do
      visit "/contractors/1"

      page.should_not have_text("Edit")
    end
  end

end
