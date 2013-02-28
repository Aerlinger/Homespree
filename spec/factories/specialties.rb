# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :specialty do
    name "MyString"
    endorsements "MyString"
    endorser_id 1
    contractor_id 1
  end
end
