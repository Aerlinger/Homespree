FactoryGirl.define do
  factory :address do
    line1 "1234 Elm Street"
    line2 "Apartment C"
    zipcode "12345"
    city Faker::Address.city
    state Faker::Address.state
  end
end