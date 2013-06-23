require 'spec_helper'

describe ContractorDecorator do

  let(:contractor) { FactoryGirl.create(:contractor).decorate }
  subject { contractor }

  it { should respond_to :portrait_upload }
  it { should respond_to :portrait_url }
  it { should respond_to :logo }
  it { should respond_to :card_item }
  it { should respond_to :city_and_state }
  it { should respond_to :stars_rating }
  it { should respond_to :edit_link }
  it { should respond_to :in_place_edit }
  it { should respond_to :intro_section }

  it "renders portrait URL" do
    contractor.portrait_url == '/uploads/contractor/portrait_url/1/assets/images/contractor_profiles/portrait_default.jpg'
  end

  it "renders in place edit block" do
    edit_html = contractor.in_place_edit(:div, :first_name) {"inner_html"}
    edit_html.should eq "<div id=\"first_name_edited\">inner_html</div>"
  end

  it "renders intro section" do
    intro_wrapper = contractor.intro_section('#intro', class: "span3") {"inner html"}
    intro_wrapper.should eq "<div class=\"span3\" id=\"#intro\">inner html</div>"
  end

  describe "renders city and state" do
    specify "when both are present" do
      contractor.city_and_state == "#{contractor.city}, #{contractor.state}"
    end

    specify "unless neither are present" do
      contractor.city_and_state == ""
    end
  end

end
