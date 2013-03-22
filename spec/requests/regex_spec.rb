require 'spec_helper'

describe "Regular expression validations for" do

  describe "Email" do
    specify { "asdf@adf.com".match(RegexDefinitions::email_regex).should_not be_nil }
  end

  describe "Zipcode" do
    specify { "10028-3347".match(RegexDefinitions::zipcode_regex).should_not be_nil }
    specify { "10028".match(RegexDefinitions::zipcode_regex).should_not be_nil }
  end

  describe "Facebook" do
    specify { "https://www.facebook.com/profile.php?id=100001536794921".match(RegexDefinitions::facebook_regex).should_not be_nil }
  end

end