FactoryGirl.define do

  factory :contractor do
    first_name "Joe"
    email { "#{first_name}#{last_name}@test.com" }
    last_name "ThePlumber"
    password "iamsecret"
    company_title "Joe's Plumbing"
    mobile_number "8485558332"
    office_number "8485558443"

    website "joetheplumber.com"
    facebook "facebook.com/joe/the/plumber"
    twitter "@joetheplumber"

    description "I am Joe The Plumber I have been in business for more than 140 years in the plumbing industry. I plumb everything from sinks to toilets. Been working in this working in the new jersey area for more than 50 years"

    # I don't know what a valid contractor license is supposed to look like...
    license "ABCD1234"
    insurance_limit '400000.00'
    bonding_limit '1400.00'
  end

  factory :photo do
    filename "contractor_default.jpg"
    name "contractor"
    contractor
  end

  factory :specialty do
    name "Specialty"
    endorsements "Endorsements"
    endorser_id 1
    contractor_id 1
  end

end