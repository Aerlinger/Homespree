class ContractorPresenter < BasePresenter

  include UserPresenter

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
    handle_none contractor.title do
      content_tag :h1, contractor.title, class: :contractor_title
    end
  end

  def description
    handle_none contractor.description do
      markdown(contractor.description)
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
      "contractor_default.jpg"
    end
  end

end