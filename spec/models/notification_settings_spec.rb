# == Schema Information
#
# Table name: notification_settings
#
#  id                   :integer          not null, primary key
#  text_notifications   :boolean          default(TRUE)
#  email_notifications  :boolean          default(TRUE)
#  on_payment           :boolean          default(TRUE)
#  on_message           :boolean          default(TRUE)
#  on_scheduling        :boolean          default(TRUE)
#  on_deal              :boolean          default(TRUE)
#  featured_contractors :boolean          default(TRUE)
#  notifiable_id        :integer
#  notifiable_type      :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'spec_helper'

describe NotificationSettings do

  let(:notification_settings) { FactoryGirl.create(:notification_settings) }
  subject { notification_settings }

  it { should respond_to :text_notifications }
  it { should respond_to :featured_contractors }
  it { should respond_to :email_notifications }
  it { should respond_to :on_payment }
  it { should respond_to :on_message }
  it { should respond_to :on_scheduling }
  it { should respond_to :on_deal }

  describe "when created as a nested attribute for contractor" do

    let(:params) do
      {
        contractor: {
          id: 5,
          notification_settings: FactoryGirl.attributes_for(:notification_settings)
        }
      }
    end

    before { @contractor = Contractor.create(params[:contractor]) }

    it "is valid" do
      @contractor.should be_valid
    end

    it "is initialized as a child" do
      @contractor.notification_settings.should eq notification_settings
    end

  end

end
