require 'spec_helper'

describe ContractorsController do


  let(:this_contractor) { FactoryGirl.create(:contractor) }
  let(:contractor) { FactoryGirl.create(:contractor) }

  describe "GET #show" do
    before(:each) { get :show, id: this_contractor.id }

    context "contractor is viewing their own profile" do
      it "should render controls to edit the page" do
        expect(response).to render_template :show
      end
    end

    it "should assign contractor to contractor" do
      expect(assigns(:contractor)).to eq this_contractor
    end

    it "should render contractor page" do
      expect(response).to render_template(:show)
    end
  end

  describe "PUT #update" do

    before :each do
      contractor = create(:contractor, email: "updatedcontractorrspec.com")
    end

    it "locates the requested contractor" do
      put :update, id: contractor.id, contractor: attributes_for(:contractor, email: "updatedcontractorrspec.com")
      expect(assigns(:contractor)).to eq(contractor)
    end

    context "with valid params" do
      it "save the new contractor in the database" do
        put :update, id: contractor, contractor: attributes_for(:contractor, first_name: "George")
        contractor.reload
        expect(contractor.first_name).to eq("George")
      end

      it "redirects to the updated contractor profile" do
        put :update, id: contractor, contractor: attributes_for(:contractor, first_name: "George")
        expect(response.status).to eq 200
      end
    end

    context "with invalid params" do
      it "does not change contractors attributes" do
        put :update, id: contractor, contractor: attributes_for(:contractor, email: "lol")
      end
    end

    describe "with nested attributes for photos" do
      let(:photo_attributes) { FactoryGirl.attributes_for(:photo) }

      it " properly updates photos on the Contractor model" do
        put :update, attributes_for(:contractor, photos: photo_attributes)
      end

      it "increases the number of photos by 1" do
        put :update, attributes_for(:contractor, photos: photo_attributes)
      end

    end

    describe "with nested attributes for address" do
      let(:address_attributes) { FactoryGirl.attributes_for(:address) }

      it "should properly update the address on the Contractor model" do
        put :update, attributes_for(:contractor, address: address_attributes)
      end

    end

    describe "with nested attributes for appointments" do
      let(:appointment_attributes) { FactoryGirl.attributes_for(:appointment) }

      it "properly updates appointments on the contractor profile" do
        put :update, attributes_for(:contractor, address: address_attributes)
      end

      it "should create a new appointment" do
        expect {
          put :update, attributes_for(:contractor, address: address_attributes)
        }.to increase(Address.count).by(1)
      end
    end

  end


end