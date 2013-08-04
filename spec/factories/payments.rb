# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    amount "9.99"
    recipient "MyText"
    description "MyText"
  end
end
