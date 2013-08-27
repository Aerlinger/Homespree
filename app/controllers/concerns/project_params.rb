module Concerns::ProjectParams
  extend ActiveSupport::Concern

  def project_params
    params.require(:project).permit(
      :zipcode,
      :project_type_id,
      :title,
      :description,
      :homeowner_id,
      :contractor_id,
      :service_type_name,
      address_attributes: [:zipcode, :line1, :line2, :city, :state],
      appointments_attributes: [:address, :starts_at, :duration, :attributes, :zipcode],
      photos_attributes: [:image_url, :name, :caption]
    )
  end
end
