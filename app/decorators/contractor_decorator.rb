class ContractorDecorator < Draper::Decorator
  delegate_all

  include BestInPlace::BestInPlaceHelpers

  def portrait_picture
    image_tag "contractors/#{@source.profile_pic_filename}", class: "contractor_portrait"
  end

  def full_name
    "#{@source.first_name} #{@source.last_name}"
  end

  def title
    h.content_tag :h1, @source.company_title.html_safe, class: [:contractor_title, "block-underline-full"]
  end

  def title_or_full_name
    if @source.company_title?
      @source.company_title
    else
      full_name
    end
  end

  def incomplete_sections

  end

  def rating

  end

  def website
    h.content_tag :small do
      h.link_to @source.website.gsub("http://", ""), @source.website, class: "contractor_website"
    end
  end

  def twitter
    h.link_to @source.twitter, "http://twitter.com/#{@source.twitter}", class: "contractor_twitter"
  end

  # Todo: stubbed for now:
  def specialties
    html = h.content_tag_for :li, @source.specialties do |specialty|
      specialty.name
    end

    html << h.link_to("/contractors/profiles/#{@source.id}/add_specialty", remote: true, id: "specialty_list") do
      res = h.content_tag :icon, "", class: "icon-plus-sign", style: "color: green;"
      res << h.content_tag(:span, "  Add Specialty", id: "add_specialty")
    end
  end

  def profile_pic_filename
    if @source.photo_filename.present?
      @source.photo_filename
    else
      "default_portrait.jpg"
    end
  end

end
