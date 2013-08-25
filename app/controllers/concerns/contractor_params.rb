module Concerns::ContractorParams
  extend ActiveSupport::Concern

  def contractor_params
    params.require(:contractor).permit(:company_title,
                                       :email,
                                       :password,
                                       :first_name,
                                       :last_name,
                                       :office_number,
                                       :mobile_number,
                                       :website,
                                       :facebook,
                                       :twitter,
                                       :license,
                                       :bonding_limit,
                                       :insurance_limit,
                                       :hourly_rate,
                                       :slogan,
                                       :description,
                                       address_attributes: [:zipcode, :line1, :line2, :city, :state],
                                       appointments_attributes: [:address, :starts_at, :duration, :attributes, :zipcode],
                                       photos_attributes: [:image_url, :name, :caption]
    )
  end
end
