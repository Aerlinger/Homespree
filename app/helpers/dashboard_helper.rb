module DashboardHelper

  def active_notifications_path
    "active" if controller.action_name == "notifications"
  end

  def active_general_settings_path
    "active" if controller.action_name == "general_settings"
  end

  def active_inbox_path
    "active" if controller.action_name == "inbox"
  end

  def active_my_projects_path
    "active" if controller.action_name == "my_projects"
  end

  def active_my_income_path
    "active" if controller.action_name == "income"
  end

  def active_material_calculator_path
    "active" if controller.action_name == "material_calculator"
  end

end