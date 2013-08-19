module ProjectWizardHelper
  def hs_text_field(param, label)
    render "project_wizard/components/text_field", param: param, label: label
  end

  def hs_check_box_field(param, label, checked = false)
    render "project_wizard/components/check_box_field", param: param, label: label, tags: tags
  end

  def hs_number_field(param, label)
    render "project_wizard/components/number_field", param: param, label: label
  end

  def hs_select_field(param, label, tags = {})
    render "project_wizard/components/select_field", param: param, label: label, tags: tags
  end

  def hs_text_collection_field(param, label, tags = {})
    render "project_wizard/components/text_collection_field", param: param, label: label, tags: tags
  end

  def hs_radio_collection_field(param, label, tags = {})
    render "project_wizard/components/check_box_field", param: param, label: label, tags: tags
  end

  def hs_check_collection_field(param, label, tags = {})
    render "project_wizard/components/check_box_field", param: param, label: label, tags: tags
  end
end
