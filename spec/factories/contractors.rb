FactoryGirl.define do
  factory :contractor do
    sequence :email do |n|
      "contractor#{n}@rspec.com"
    end

    first_name "Joe"
    last_name "ThePlumber"

    password "iamsecret"
    company_title "Joe's Plumbing"
    office_number "8485558443"
    mobile_number "8485558332"

    website "http://www.joesplumbing.com"
    facebook "www.facebook.com/joe_the_plumber"
    twitter "@joe_the_plumber"
    disabled false

    license "ABCDEFG12345"
    insurance_limit 200000.0
    bonding_limit 100000.0
    hourly_rate 123

    slogan "I am Joe the plumber"
    description "I am Joe The Plumber I have been in business for more than 140 years in the plumbing industry. I plumb everything from sinks to toilets. Been working in this working in the new jersey area for more than 50 years"

    address
  end

  factory :invalid_contractor, parent: :contractor do
    email "invalidemail"
  end
end