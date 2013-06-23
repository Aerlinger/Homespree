describe "Geocoder" do

  let(:address) { FactoryGirl.create :address }
  subject { address }

  it { should respond_to :near }
  it { should respond_to :nearbys }
  it { should respond_to :distance_from }
  it { should respond_to :distance_to }
  it { should respond_to :bearing_to }
  it { should respond_to :bearing_from }

  it { should respond_to :coordinates }
  it { should respond_to :to_coordinates }

  it { should be_geocoded }

end