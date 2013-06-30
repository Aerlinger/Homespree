FactoryGirl.define do
  factory :service_type do
    sequence(:name) do |n|
      "RspecPainting #{n}"
    end
  end
end
