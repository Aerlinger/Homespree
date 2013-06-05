# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :homeowner do
    email "nonsense@email.com"
    password "iamsecret"
    first_name "MyString"
    last_name "MyString"

    appointments
    contractor
    homeowner
  end
end
