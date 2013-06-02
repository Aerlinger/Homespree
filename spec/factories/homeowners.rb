# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :homeowner do
    email "MyString"
    first_name "MyString"
    last_name "MyString"
    address ""
    photos ""
    appointments ""
  end
end
