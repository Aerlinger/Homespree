FactoryGirl.define do

  factory :mailinglist do
    sequence :email do |n|
      "mailinglist#{n}@rspec.com"
    end
    user_type "contractor"
  end

  factory :invalid_mailinglist, parent: :mailinglist do
    email "testmailer"
  end
end