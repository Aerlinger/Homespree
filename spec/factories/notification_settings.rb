# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification_settings do
    text_notifications false
    email_notifications false
    on_payment false
    on_message false
    on_scheduling false
    on_deal false
    featured_contractors false
  end
end
