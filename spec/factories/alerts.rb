# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alert do
    title "MyString"
    content "MyText"
    alertable_id 1
    alertable_type "MyString"
    type ""
  end
end