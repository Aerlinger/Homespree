FactoryGirl.define do

  factory :receipt do
    receiver { FactoryGirl.create :contractor }
  end

end