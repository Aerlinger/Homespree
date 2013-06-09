FactoryGirl.define do
  factory :job do
    name "Job Title"
    description "description of the job to be done"

    after_create do |job|
      3.times { create(:category) }
    end
  end
end
