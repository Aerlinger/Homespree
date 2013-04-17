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
    association :specialty
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

  factory :mailinglist do
    sequence :email do |n|
      "mailinglist#{n}@rspec.com"
    end
    user_type "contractor"
    submitted_from_mobile "true"
  end

  factory :invalid_mailinglist, parent: :mailinglist do
    email "testmailer"
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

  factory :address do
    line1 "1234 Elm Street"
    line2 "Apartment C"
    zipcode "12345"
    city Faker::Address.city
    state Faker::Address.state
  end
end