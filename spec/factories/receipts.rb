FactoryGirl.define do

  factory :receipt do
    receiver { FactoryGirl.create :contractor }
    notification_id 1
  end

end