require "spec_helper"


describe "Homeowner Dashboard" do

  let(:homeowner) { FactoryGirl.create :homeowner }

  before do
    sign_in homeowner
    click_link "Account Settings"
  end

  subject { page }

  it "is navigated to after clicking Edit Profile" do
    page.current_path.should eq "/general_settings"
  end

  describe "General Settings" do

    it "sets browser title" do
      within(:css, "#dashboard_section") do
        page.should have_content("Email")
      end
    end

    describe "Changing Email" do
      it "persists change on contractor" do
        within(:css, "#change_email") do
          fill_in "Change email", with: "changed@rspec.com"
          fill_in "Verify password", with: contractor.password

          click_button("update")
        end

        contractor.email.should eq "changed@rspec.com"
      end

      describe "Changing password" do
        before do
          within(:css, "#change_password") do
            fill_in "Current Password", with: contractor.password
            fill_in "New Password", with: "secret_password"
            fill_in "Re-type new password", with: "secret_password"

            click_button "Update"
          end
        end

        it "persists password change on contractor" do
          contractor.password.should eq "secret_password"
        end
      end

      describe "clicking Cancel my account" do

        before do
          click_link "Cancel my account"
        end

        xit "redirects to home page" do
          page.current_path.should eq "/"
        end

        xit "deletes that contractor" do
          contractor.should be_nil
        end
      end

    end

    describe "Notifications" do
      before { click_link "Notifications" }

      it "shows title" do
        within(:css, "#dashboard_section") do
          page.should have_content("Notifications")
        end
      end
    end

    describe "My Inbox" do
      before { click_link "My Inbox" }

      it "shows My Inbox title" do
        within(:css, "#dashboard_section") do
          page.should have_content("My Inbox")
        end
      end

    end

    describe "My Projects" do
      before do
        within(:css, "#dashboard_nav") do
          click_link "My Projects"
        end
      end

      it "shows title" do
        within(:css, "#dashboard_nav") do
          page.should have_content("My Projects")
        end
      end
    end

    describe "My Income" do
      before do
        within(:css, "#dashboard_nav") do
          page.should have_content("My Income")
        end
      end
    end

    describe "navigations links include" do
      specify "Notifications" do
        within(:css, "#dashboard_nav") do
          page.should have_content("Notifications")
        end
      end

      specify "General Settings" do
        within(:css, "#dashboard_nav") do
          page.should have_content("General Settings")
        end
      end

      specify "Messages" do
        within(:css, "#dashboard_nav") do
          page.should have_content("My Inbox")
        end
      end

      specify "Payment" do
        within(:css, "#dashboard_nav") do
          page.should have_content("My Income")
        end
      end
    end

  end
end