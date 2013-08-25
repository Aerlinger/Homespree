module Concerns::PhotoParams
  extend ActiveSupport::Concern

  def photo_params
    params.require(:photo).permit(
      :image_url,
      :caption,
      :name
    )
  end
end
