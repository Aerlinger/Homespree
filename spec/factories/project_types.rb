# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_type do
    sequence(:name) do |n|
      "Wallpapering #{n}"
    end

    service_type
  end
end