class ContractorDecorator < Draper::Decorator
  delegate_all

  include BestInPlace::BestInPlaceHelpers

  def title
    h.content_tag :h1, @source.company_title.html_safe, class: [:contractor_title, "block-underline-full"]
  end

  def website
    h.link_to @source.website.gsub("http://", ""), @source.website, class: "contractor_website"
  end

  def specialties

  end

end
