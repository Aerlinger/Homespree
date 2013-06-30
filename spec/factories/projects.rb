FactoryGirl.define do
  factory :project do
    title "My painting project"
    description "This is a test description of the project to be done"
    service_type_name "Painting"
    project_type_name "Interior Painting"

    zipcode "12345"

    project_type ProjectType.first
  end
end
