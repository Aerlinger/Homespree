# ========================================================================================
#
# Acts as a wrapper for contractor view data.
#

#
#- if @contractor.first_name.present?
#  %li#full_name
#    %strong Owned by
#    = best_in_place @contractor, :first_name, activator: "#name_edit"
#    - if @contractor.last_name.present?
#      = best_in_place @contractor, :last_name
#
#    =render "contractors/profiles/edit_link", activator: "name_edit"
#
#
#
#- if @contractor.years_experience.present?
#  %li#years_experience
#    %strong Years in business:
#    =best_in_place @contractor, :years_experience, activator: "#years_experience_edit"
#    =render "contractors/profiles/edit_link", activator: "years_experience_edit"

class UrlHelpers
  class << self
    include Rails.application.routes.url_helpers
    default_url_options[:host] = ::Rails.application.routes.default_url_options[:host]
  end
end

class ContractorDecorator < Draper::Decorator

  include BestInPlace::BestInPlaceHelpers
  include Draper::LazyHelpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper

  delegate_all
  decorates :contractor


  def card_item(attr_name, attrs = {})
    # Don't render blank attributes when a customer is visiting the page
    if visitor? && @object.send(attr_name).blank?
      return
    end

    h.haml_tag(:li, class: 'card-attribute', id: "card_#{attr_name}") do
      h.haml_tag(:strong, attrs[:title] || attr_name.to_s.titleize + ":")
      h.haml_concat(h.best_in_place(@object, attr_name, activator: "##{attr_name}", display_with: attrs[:display_with], :nil => attrs[:nil] || "No info"))
      if block_given?
        yield
      end
    end
  end

  def city_and_state
    address = @object.address
    if @object.address.valid?
      "#{address.city}, #{address.state}"
    end
  end

  def stars_rating
    raw "<span class='stars5'></span>"
  end

  # Renders the "Edit" link to the right of fields on the contractor page.
  # There are three possibilities:
  #   1. Contractor's own page and attribute is set: "Edit"
  #   2. Contractor's own page and attribute isnt set: "Add Info"
  #   3. Visitor: Do nothing and return nil
  def edit_link(attr_name)
    # Check if this attribute is set and saved on the contractor's profile.
    attr_exists = @object.send(attr_name).blank?

    unless visitor?
      link_text = if attr_exists
                    "Add Info"
                  else
                    "Edit"
                  end

      h.link_to "javascript:void(0)", id: attr_name, class: "edit-link #{link_text}" do
        #content_tag(:i, class: "e-icon-pencil", style: "height: 20px; line-height: 16px;")
        link_text
      end
    end
  end

  def visitor?
    return false
    if contractor_signed_in? && current_contractor.id == params[:id]
      return false
    end
    return true
  end


end
