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

  def portrait_upload(image_url= asset_path("contractor_profiles/portrait_default.jpg"))
    portrait_missing = @object.portrait_url ? "_edited" : ""

    h.image_tag @object.portrait_url.to_s || image_url, id: "contractor_portrait", class: portrait_missing
    h.haml_concat link_to "Upload portrait", "#", class: "btn btn-success btn-small", id: "upload_portrait"
  end

  def portrait_url
    if @object.portrait_url.to_s.blank?
      "/assets/contractor_profiles/portrait_default.jpg"
    else
      @object.portrait_url
    end
  end

  def logo
    if @object.logo_url?
      h.haml_concat image_tag @object.logo_url
      h.haml_concat link_to("Change logo", "#", class: "btn btn-info btn-mini", id: "upload_logo")
      h.haml_concat link_to("Delete logo", contractor_path(id: @object.id, contractor: {remove_logo_url: true}),
                            confirm: "Are you sure you want to delete your logo from the description?",
                            method: :put, class: "btn btn-danger btn-mini delete-button pull-right")
        #=%i.e-icon-cancel
        #h.content_tag(:i, class: "e-icon-cancel")
      #end
    else
        h.haml_concat link_to "Upload company logo", "#", class: "btn btn-info", id: "upload_logo"
    end
  end

  ## The contractor's own business logo
  def logo_upload(image_url="logo_placeholder.jpg")
    #h.link_to "Upload logo", "#", class: "btn btn-info btn-small"
  end

  # Displays the badges for each contractor:
  def badge(name = "approved")
    h.image_tag(asset_path("profile/badges/#{name}_badge.png"))
  end

  def card_item(attr_name, attrs = {})
    # Don't render blank attributes when a customer is visiting the page
    if visitor? && @object.send(attr_name).blank?
      return
    end

    field_missing = contractor_missing_attr?(attr_name) ? "" : "_edited"

    h.haml_tag(:li, class: "card-attribute #{field_missing}", id: "card_#{attr_name.to_s + field_missing}") do
      h.haml_tag(:strong, attrs[:title] || attr_name.to_s.titleize + ":")
      h.haml_concat(h.best_in_place(@object, attr_name, activator: "##{attr_name}", display_with: attrs[:display_with], :nil => attrs[:nil] || "No info provided"))
      if block_given?
        yield
      end
    end
  end


  def city_and_state
    address = @object.address
    if @object.address.city? && @object.address.state?
      "#{address.city.presence}, #{address.state.presence}"
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

      h.link_to "javascript:void(0)", id: attr_name, class: "edit-link #{link_text} pull-right" do
        #h.haml_concat h.content_tag(:i, class: "e-icon-pencil", style: "height: 20px; line-height: 16px;")
        h.haml_concat link_text
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
    if contractor_signed_in? && (params[:id] == current_contractor.slug || params[:id].to_i == current_contractor.id)
      return false
    end
    return true
  end

  protected

  def upload_for(attribute, name)
    s3_uploader_form put: @contractor, as: "photo[#{attribute.to_s}]" do
      file_field_tag :file, multiple: true
    end
  end

end