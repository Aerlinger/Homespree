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
#- if @contractor.years_experience.present?
#  %li#years_experience
#    %strong Years in business:
#    =best_in_place @contractor, :years_experience, activator: "#years_experience_edit"
#    =render "contractors/profiles/edit_link", activator: "years_experience_edit"
#
#- if @contractor.license.present?
#  %li#license_number
#    %strong License
#    = "# #{@contractor.license}"
#    %i.icon-question-sign.detailsPop{"data-content" => "License Info", "data-rel" => "popover", :title => "License Info"}
#
#- if @contractor.insurance_limit.present?
#  %li#insured_up_to
#    %strong Insured
#    = "up to #{@contractor.insurance_limit}"
#    %i.icon-question-sign.detailsPop{"data-content" => "License Info", "data-rel" => "popover", :title => "License Info"}
#
#- if @contractor.bonding_limit.present?
#  %li#bonded_up_to
#    %strong Bonded
#    = "up to $#{@contractor.bonding_limit}"
#    %i.icon-question-sign.detailsPop{"data-content" => "Bond info", "data-rel" => "popover", :title => "Bond Info"}

# ========================================================================================
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
    if visitor? && @source.send(attr_name).blank?
      return
    end

    h.haml_tag(:li, class: 'card-attribute', id: "card_#{attr_name}") do
      h.haml_tag(:strong, attrs[:title] || attr_name.to_s.titleize + ":")
      h.haml_concat(h.best_in_place(@source, attr_name, activator: "##{attr_name}", display_with: attrs[:display_with], :nil => attrs[:nil] || "<em>No info</em>"))
      if block_given?
        yield
      end
    end
  end

  # Renders the "Edit" link to the right of fields on the contractor page.
  # There are three possibilities:
  #   1. Contractor's own page and attribute is set: "Edit"
  #   2. Contractor's own page and attribute isnt set: "Add"
  #   3. Visitor: Do nothing and return nil
  def edit_link(attr_name)
    unless visitor?
      link_text = if @source.send(attr_name).blank?
        "Add Info"
      else
        "Edit"
      end

      h.link_to "javascript:void(0)", id: attr_name, class: "edit-link #{link_text.underscore}" do
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
