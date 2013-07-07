FactoryGirl.define do
  factory :service_type do
    sequence(:name) { |n| "Painting #{n}" }
  end
end
