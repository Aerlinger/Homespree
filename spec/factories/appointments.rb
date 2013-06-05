FactoryGirl.define do
  factory :appointment do
    date Date.new(2013, 12, 3)
    time Time.new(12, 1, 3)

    address
    contractor
    homeowner
  end
end