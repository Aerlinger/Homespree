FactoryGirl.define do
  factory :homeowner do
    sequence :email do |n|
      "rspec_homeowner#{n}@email.com"
    end
    password "iamsecret"
    first_name "RspecHomeowner"
    last_name "RspecHomeowner"

    #address
    #appointments { [FactoryGirl.create(:appointment)] }
  end
end
