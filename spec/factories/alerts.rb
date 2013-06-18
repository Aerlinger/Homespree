# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alert do
    title "Alert Title"
    content "Alert Content"
    notice_type "notice"
  end
end
