FactoryGirl.define do
  factory :job_category do
    name "RspecPainting"

    job_subcategories {[ FactoryGirl.create(:job_subcategory) ]}
  end
end
