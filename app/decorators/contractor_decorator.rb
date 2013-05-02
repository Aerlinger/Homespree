class ContractorDecorator < Draper::Decorator
  delegate_all

  def portrait_picture
    image_tag "contractors/#{profile_pic_filename}", class: "contractor_portrait"
  end

  def full_name
    handle_none contractor.first_name do
      "#{contractor.first_name} #{contractor.last_name}"
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

  def address
    if current_contractor == object
      h.content_tag :p, object.address.line1
      h.content_tag :p, object.address.line2
      h.content_tag :p do
        h.content_tag :span, object.address.city
        h.content_tag :span, object.address.state
        h.content_tag :span, object.address.zip
      end
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


  def rating

  end

  def description
    handle_none contractor.description do
      content_tag :p do
        contractor.description
      end
    end
  end

  def website
    handle_none contractor.website do
      content_tag :small do
        h.link_to contractor.website.gsub("http://", ""), contractor.website, class: "contractor_website"
      end
    end
  end

  def twitter
    handle_none contractor.twitter do
      h.link_to contractor.twitter, "http://twitter.com/#{contractor.twitter}", class: "contractor_twitter"
    end
  end

  # Todo: stubbed for now:
  def specialties
    specialties = ["Indoor Painting", "Outdoor Painting", "Roofing", "Pool Maintenance", "Plumbing"]

    output = []
    content_tag :ul do
      specialties.each do |specialty|
        output << content_tag(:li, specialty)
      end
    end

    output.join.html_safe
  end

  def profile_pic_filename
    if contractor.photo_filename.present?
      contractor.photo_filename
    else
      "default_portrait.jpg"
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
