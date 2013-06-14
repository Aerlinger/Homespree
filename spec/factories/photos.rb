FactoryGirl.define do

  factory :photo do
    image_url "contractor_default.jpg"
    name "contractor"
  end

  factory :photos, class: "photo" do
    create :photo
  end

end