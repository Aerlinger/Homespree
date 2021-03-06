FactoryGirl.define do
  factory :project do
    title "My painting project"
    description "This is a test description of the project to be done"

    service_type_name "Painting"
    project_type_name "Interior Painting"

    zipcode "12345"

    project_type

    homeowner

    factory :request do
      #properties {
      #  width: {
      #    label: :window_height,
      #    field_type: :text_field
      #  }
      #}
    end
  end
end
