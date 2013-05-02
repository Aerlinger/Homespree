class ContractorDecorator < Draper::Decorator
  delegate_all

  def portrait_picture
    image_tag "contractors/#{profile_pic_filename}", class: "contractor_portrait"
  end

  def full_name
    "#{contractor.first_name} #{contractor.last_name}"
  end

  def title
    h.content_tag :h1, @source.company_title.html_safe, class: [:contractor_title, "block-underline-full"]
  end

  def title_or_full_name
    if @source.title?
      @source.title
    else
      full_name
    end
  end

  def incomplete_sections
    if @source.incomplete_sections.any?
      html_data = h.content_tag :div do
        ul = h.content_tag :ul do

          links = @source.incomplete_sections.map do |section|
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
    h.content_tag :p do
      @source.description
    end
  end

  def website
    h.content_tag :small do
      h.link_to @source.website.gsub("http://", ""), @source.website, class: "contractor_website"
    end
  end

  def twitter
    h.link_to @source.twitter, "http://twitter.com/#{contractor.twitter}", class: "contractor_twitter"
  end

  # Todo: stubbed for now:
  def specialties
    h.content_tag_for :li, @source.specialties do |specialty|
      specialty.name
    end

    # TODO: Render Add specialty link inline
    #h.link_to "#", style: "list-style: none; font-size: 1.5em;" do
    #  h.content_tag :icon, "", class: "icon-plus-sign", style: "color: green;" do
    #  h.content_tag :span, "Add Specialty", id: "add_specialty"
    #  end
    #end

  end

  def profile_pic_filename
    if @source.photo_filename.present?
      @source.photo_filename
    else
      "default_portrait.jpg"
    end
  end

  # Define presentation-specific methods hsere. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
