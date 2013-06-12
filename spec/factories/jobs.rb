FactoryGirl.define do
  factory :job do
    title "Job name"
    description "This is a test description of the job to be done"
    appointment
    #before_photos { [FactoryGirl.create(:photo)] }
    #after_photos { [FactoryGirl.create(:photo)] }
    #job_categories { [FactoryGirl.create(:job_category)] }
  end
end
