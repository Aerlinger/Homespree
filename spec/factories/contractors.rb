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

    license "ABCDEFG12345"
    insurance_limit 200000.0
    bonding_limit 100000.0

    slogan "I am Joe the plumber"
    description "I am Joe The Plumber I have been in business for more than 140 years in the plumbing industry. I plumb everything from sinks to toilets. Been working in this working in the new jersey area for more than 50 years"

    # Associations
    #address

    after(:build) do |contractor|
      #contractor.photos << FactoryGirl.build(:photo)
      #contractor.appointments << FactoryGirl.build(:appointment)
      #contractor.job_category << FactoryGirl.build(:job_category)
      #contractor.messages << FactoryGirl.build(:messages)
    end

  end

  factory :invalid_contractor, parent: :contractor do
    email "invalidemail"
  end

end