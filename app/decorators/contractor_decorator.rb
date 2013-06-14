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
  include Haml::Helpers

  delegate_all
  decorates :contractor


  def card_item(attr_name, attrs = {})
    # Don't render blank attributes when a customer is visiting the page
    if visitor? && @object.send(attr_name).blank?
      return
    end

    field_missing = contractor_missing_attr?(attr_name) ? "" : "_edited"

    h.haml_tag(:li, class: "card-attribute #{field_missing}", id: "card_#{attr_name.to_s + field_missing}") do
      h.haml_tag(:strong, attrs[:title] || attr_name.to_s.titleize + ":")
      h.haml_concat(h.best_in_place(@object, attr_name, activator: "##{attr_name}", display_with: attrs[:display_with], :nil => attrs[:nil] || "No info"))
      if block_given?
        yield
      end
    end
  end


  def city_and_state
    address = @object.address
    if @object.try(:address).try(:valid?)
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
    unless visitor?
      link_text = if contractor_missing_attr?(attr_name)
                    "Add Info"
                  else
                    "Edit"
                  end

      h.link_to "javascript:void(0)", id: attr_name, class: "edit-link #{link_text}" do
        h.content_tag(:i, class: "e-icon-pencil", style: "height: 20px; line-height: 16px;")
        h.haml_concat(link_text)
      end
    end
  end

  # A simple wrapper object that handles the logic for in-place editing
  # Nullifies DOM element if it has already been edited.
  def in_place_edit(tag, attr, options = {}, &block)

    # Nullify an edited tag for Intro sequence by changing its ID.
    unless contractor_missing_attr?(attr)
      attr = "#{attr}_edited"
    end

    h.content_tag(tag, options.merge(id: attr.to_s), &block)
  end

  # Defines a highlighted section for the intro sequence. By default, this will be only displayed once.
  def intro_section(id, options, &block)
    # Nullify an edited tag for Intro sequence by changing its ID
    id = "#{id}_edited" if @object.edited?

    h.content_tag(:div, options.merge(id: id), &block)
  end



  # Check if this attribute is set and saved on the contractor's profile.
  def contractor_missing_attr?(attr_name)
    @object.send(attr_name).blank?
  end

  def visitor?
    return false # TODO: returns false for simple testing
    if contractor_signed_in? && current_contractor.id == params[:id]
      return false
    end
    return true
  end


end
