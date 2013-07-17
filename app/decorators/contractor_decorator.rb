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

  def portrait_upload

  end



  def card_item(attr_name, attrs = {})
    field_missing = "_edited"

    if h.own_profile? && contractor_missing_attr?(attr_name)
      field_missing = ""
    end

    # Don't render blank attributes when a customer is visiting the page
    h.haml_tag(:li, class: "card-attribute #{field_missing}", id: "card_#{attr_name.to_s + field_missing}") do
      h.haml_tag(:strong, attrs[:title] || attr_name.to_s.titleize + ":")
      h.haml_concat(h.best_in_place(@object, attr_name, activator: "##{attr_name}", display_with: attrs[:display_with], :nil => attrs[:nil] || "-"))

      yield
    end
  end

  def city_and_state
    "#{@object.city.presence}, #{@object.state.presence}"
  end

# Renders the "Edit" link to the right of fields on the contractor page.
# There are three possibilities:
#   1. Contractor's own page and attribute is set: "Edit"
#   2. Contractor's own page and attribute isnt set: "Add Info"
#   3. Visitor: Do nothing and return nil
  def edit_link(attr_name)
    if h.own_profile?
      link_text = contractor_missing_attr?(attr_name) ? "Add" : "Edit"

      h.link_to("javascript:void(0)", id: attr_name, class: "edit-link #{link_text} pull-right") do
        #h.haml_concat h.content_tag(:i, class: "e-icon-pencil", style: "height: 20px; line-height: 16px;")
        h.haml_concat link_text
      end
    end
  end

  # A simple wrapper object that handles the logic for in-place editing
  # Nullifies DOM element if it has already been edited.
  def in_place_edit(tag, attr, options = {}, &block)

    # Nullify an edited tag for Intro sequence by changing its ID.
    if !contractor_missing_attr?(attr) or !h.own_profile?
      attr = "#{attr}_edited"
    end

    h.content_tag(tag, options.merge(id: attr.to_s), &block)
  end

  # Defines a highlighted section for the intro sequence. By default, this will be only displayed once.
  def intro_section(id, options, &block)
    # Nullify an edited tag for Intro sequence by changing its ID
    id = "#{id}_edited" if @object.edited? || @object.sign_in_count > 1 || !h.own_profile?

    h.content_tag(:div, options.merge(id: id), &block)
  end

  private

  def change_or_delete_image()
    h.haml_concat link_to("Change logo", "#", class: "btn btn-info btn-mini pull-left", id: "upload_logo")
    h.haml_concat link_to("Delete logo", contractor_path(id: @object.id, contractor: { remove_logo_url: true }),
                          confirm: "Are you sure you want to delete your logo from the description?",
                          method:  :put, class: "btn btn-danger btn-mini delete-button pull-right")
  end

  # Check if this attribute is set and saved on the contractor's profile.
  def contractor_missing_attr?(attr_name)
    @object.send(attr_name).blank?
  end
end