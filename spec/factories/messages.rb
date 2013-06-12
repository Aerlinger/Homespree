# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    content "MyString"
    author_id 1
    thread_id 1
  end
end
