module Concerns::HomeownerParams
  extend ActiveSupport::Concern

  def homeowner_params
    params.require(:homeowner).permit(
                                       :email,
                                       :password,
                                       :first_name,
                                       :last_name,
                                       :office_number,
                                       :mobile_number,
                                       :zipcode,
                                       address_attributes: [:zipcode, :line1, :line2, :city, :state],
                                       appointments_attributes: [:address, :starts_at, :duration, :attributes, :zipcode],
                                       photos_attributes: [:image_url, :name, :caption]
    )
  end
end
