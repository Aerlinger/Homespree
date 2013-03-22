class ContractorPresenter < BasePresenter

  include UserPresenter
  include ActionView::Helpers::RecordTagHelper

  presents :contractor
  delegate :email, to: :contractor

  def portrait_picture
    image_tag "contractors/#{profile_pic_filename}", class: "contractor_portrait"
  end

  def full_name
    handle_none contractor.first_name do
      "#{contractor.first_name} #{contractor.last_name}"
    end
  end

  def email
    handle_none contractor.email do
      contractor.email
    end
  end

  def title
    handle_none contractor.company_title do
      content_tag :h1, contractor.company_title.html_safe, class: [:contractor_title, "block-underline-full"]
    end
  end

  def title_or_full_name
    if contractor.title?
      contractor.title
    else
      full_name
    end
  end

  def incomplete_sections
    if contractor.incomplete_sections.any?


      html_data = content_tag :div do
        ul = content_tag :ul do

          links = contractor.incomplete_sections.map do |section|
            content_tag :li do
              link_to section
            end
          end

          links.join.html_safe
        end

      end
      html_data.html_safe
    end

  end

  def description
    handle_none contractor.description do
      contractor.description
    end
  end

  def website
    handle_none contractor.website do
      h.link_to contractor.website, contractor.website, class: "contractor_website"
    end
  end

  def twitter
    handle_none contractor.twitter do
      h.link_to contractor.twitter, "http://twitter.com/#{contractor.twitter}", class: "contractor_twitter"
    end
  end

  def specialties
    "Specialties will go here"
  end

  private

  def profile_pic_filename
    if contractor.photo_filename.present?
      contractor.photo_filename
    else
      "default_portrait.jpg"
    end
  end

end