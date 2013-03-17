FactoryGirl.define do

  factory :contractor do
    first_name "Joe"
    last_name "ThePlumber"
    password "iamsecret"
    email { "#{first_name}#{last_name}@test.com" }
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