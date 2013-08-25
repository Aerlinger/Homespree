require 'spec_helper'

describe ContractorsController do
  it { should respond_to :show }
  it { should respond_to :update }
  it { should respond_to :settings }
  it { should respond_to :material_calculator }

  let!(:contractor) { FactoryGirl.create(:contractor) }
  params = {id: 11, photos_attributes: [{image_url: "asdf"}]}

  before { sign_in contractor }

  it "assigns current_user to the contractor" do
    current_user.should eq contractor
  end

  describe "GET #show" do
    before(:each) { get :show, id: contractor.id }

    context "contractor is viewing their own profile" do
      it "renders controls to edit the page" do
        expect(response).to render_template :profile
      end
    end

    it "decorates contractor" do
      assigns(:contractor).should be_decorated_with ContractorDecorator
    end

    it "assigns contractor to contractor" do
      expect(assigns(:contractor)).to eq contractor
    end

    it "renders contractor page" do
      expect(response).to render_template(:profile)
    end
  end

  describe "PUT #update" do
    let(:contractor2) { FactoryGirl.create :contractor, email: "updatedcontractor@rspec.com" }
    #before :each do
    #  contractor2 = create(:contractor, email: "updatedcontractor@rspec.com")
    #end

    it "locates the requested contractor" do
      put :update, id: contractor2.id, contractor: attributes_for(:contractor, email: "updatedcontractorrspec.com")
      expect(assigns(:contractor)).to eq(contractor2)
    end

    context "with valid params" do
      it "save the new contractor in the database" do
        put :update, id: contractor.id, contractor: attributes_for(:contractor, first_name: "George")
        contractor.reload
        expect(contractor.first_name).to eq("George")
      end

      it "redirects to the updated contractor profile" do
        put :update, id: contractor.id, contractor: attributes_for(:contractor, first_name: "George")
        expect(response).to render_template(:update)
      end
    end

    context "with invalid params" do
      it "does not change contractors attributes" do
        put :update, id: contractor2.id, contractor: attributes_for(:contractor, email: "lol")
        expect(assigns(:contractor)).to eq(contractor2)
      end
    end

    describe "with nested attributes for photos" do
      it " properly updates photos on the Contractor model" do
        put :update, id: contractor.id, contractor: {photos_attributes: [FactoryGirl.attributes_for(:photo)]}
        request.params[:contractor][:photos_attributes].should eq([FactoryGirl.attributes_for(:photo).stringify_keys])
      end

      it "increases the number of photos by 1" do
        put :update, id: contractor.id, contractor: {photos_attributes: [FactoryGirl.attributes_for(:photo)]}
        request.params[:contractor][:photos_attributes].should eq([FactoryGirl.attributes_for(:photo).stringify_keys])
      end
    end

    describe "with nested attributes for address" do
      let(:address_attributes) { FactoryGirl.attributes_for(:address) }

      it "properly updates the address on the Contractor model" do
        put :update, id: contractor, contractor: {address_attributes: FactoryGirl.attributes_for(:address)}
        request.params[:contractor][:address_attributes].should eq(FactoryGirl.attributes_for(:address).stringify_keys)
      end
    end

    describe "with nested attributes for appointments" do
      let(:appointment_attributes) { FactoryGirl.attributes_for(:appointment) }

      it "properly updates appointments on the contractor profile" do
        put :update, id: contractor, contractor: {appointments_attributes: [FactoryGirl.attributes_for(:appointment)]}
        request.params[:contractor][:appointments_attributes].should
          eq([FactoryGirl.attributes_for(:appointment)])
      end

      it "creates a new appointment" do
        put :update, id: contractor, contractor: {appointments_attributes: [FactoryGirl.attributes_for(:appointment)]}
        request.params[:contractor][:appointments_attributes].should
          eq(FactoryGirl.attributes_for(:appointment))
      end
    end

    describe "sanitizes params" do
      before do
        params = {
          hourly_rate: "$134.50",
          bonding_limit: "$2,111,134.50",
          insurance_limit: "$1,134.50"
        }
        put :update, id: contractor.id, contractor: params
      end

      it "sanitizes bonding limit" do
        request.params[:contractor][:bonding_limit].should eq "2111134"
        contractor.bonding_limit == 2111134
      end

      it "sanitizes insurance limit" do
        request.params[:contractor][:insurance_limit].should eq "1134"
        contractor.insurance_limit == 1134
      end

      it "sanitizes hourly_rate limit" do
        request.params[:contractor][:hourly_rate].should eq "134"
        contractor.hourly_rate == 134
      end
    end
  end
end
