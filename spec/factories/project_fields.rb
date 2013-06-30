# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_field do
    name "Windows"
    field_type "text_field"
    required true
    project_type
  end
end
