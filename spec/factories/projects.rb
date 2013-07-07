FactoryGirl.define do
  factory :project do
    title "My painting project"
    description "This is a test description of the project to be done"

    service_type_name "Painting"
    project_type_name "Interior Painting"

    zipcode "12345"

    # Build an association if you want:
    # after(:build) do |project|
    #   project.appointments << FactoryGirl.build(:appointment)
    # end
  end
end
