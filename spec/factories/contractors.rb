FactoryGirl.define do

  factory :contractor do
    sequence :email do |n|
      "contractor#{n}@rspec.com"
    end

    first_name "Joe"
    last_name "ThePlumber"

    password "iamsecret"
    company_title "Joe's Plumbing"
    mobile_number "8485558332"
    office_number "8485558443"

    website "joetheplumber.com"
    facebook "facebook.com/joe/the/plumber"
    twitter "@joetheplumber"

    description "I am Joe The Plumber I have been in business for more than 140 years in the plumbing industry. I plumb everything from sinks to toilets. Been working in this working in the new jersey area for more than 50 years"

    association :address
  end

  factory :invalid_contractor, parent: :contractor do
    email "invalidemail"
  end

  factory :minimal_contractor, class: Contractor do
    sequence :email do |n|
      "min_contractor#{n}@rspec.com"
    end

    company_title "Mike's Contracting"
    password "iamsecret"
  end

end