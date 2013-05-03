class AddressDecorator < Draper::Decorator
  delegate_all

  include Draper::LazyHelpers
  include BestInPlace::BestInPlaceHelpers

  def show
    html = h.image_tag "/assets/profile/staticmap.png"

    html << h.content_tag(:div, @source.line1)
    html << h.content_tag(:div, @source.line2)
    html << h.content_tag(:span, "#{@source.city}, #{@source.state}")
  end
end