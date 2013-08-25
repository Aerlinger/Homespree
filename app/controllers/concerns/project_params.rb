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
      :service_type_name
    )
  end
end
