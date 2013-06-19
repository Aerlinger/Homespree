FactoryGirl.define do
  factory :appointment do |f|
    starts_at DateTime.new(2013, 12, 3)
    duration 2.2

    address
  end
end