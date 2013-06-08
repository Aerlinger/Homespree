FactoryGirl.define do
  factory :homeowner do
    sequence :email do |n|
      "rspec_homeowner#{n}@email.com"
    end
    password "iamsecret"
    first_name "MyString"
    last_name "MyString"

    address
  end
end
