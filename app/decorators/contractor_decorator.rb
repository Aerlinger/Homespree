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
  #include Draper::LazyHelpers
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper

  delegate_all

  #decorates :contractor


  #def specialties
  #  decorate_card_attribute(:specialties, "Primary Service", @contractor.specialties.first.name)
  #end

  def card_item(attr_name, attrs = {})
    response = ""
    h.content_tag(:li, id: attr_name) do
      response << h.content_tag(:strong, "Owner")
      response << @source.send(attr_name)
      response << best_in_place(@source, attr_name)
    end
  end

  def primary_service

  end

  def owner_name

  end

  def phone

  end

  def license

  end

  def insurance

  end

  def bonded

  end


  # Contractor Card: list of Fields -- name, license info, etc...
  #===============================================================================================
  def primary_service
    if contractor_signed i
    end
  end

  private


  #- if @contractor.mobile_number.present?
  #  %li#mobile_number
  #    %strong Phone:
  #    =best_in_place @contractor, :mobile_number, display_with: :number_to_phone, activator: "#phone_edit"
  #    =render "contractors/profiles/edit_link", activator: "phone_edit"
  def decorate_card_attribute(field, description, value)

    if @contractor.send(:field).present?
      #  content_tag(:li, id: field) do
      #    content_tag(:strong) description
      #    if own_profile?
      #      best_in_place @contractor, field, display_with: attrs[:display_with], activator: "##{field}_edit"
      #      render "contractors/profiles/edit_link", activator: "#{field}_edit" if own_profile?
      #    else
      #      content_tag(:span, id: "#{field}_text") value
      #    end
      #  end
      #
      #elsif own_profile
      #  # Draw the field with label "Click to enter data"
      #  content_tag(:li, id: field) do
      #    content_tag(:em, field: "#{id}_text") "Click to add info"
      #    render "contractors/profiles/edit_link", activator: "#{field}_edit" if own_profile?
      #  end
    end

  end

# Returns true if the current profile page is the same as the logged in contractor:
  def own_profile?

  end

# Returns default html if now
  def handle_none
    #if own_profile?
    #  content_tag(:strong) "Click to enter information"
    #end
  end

end
