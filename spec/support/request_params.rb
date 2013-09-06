module CapybaraRequest
  def capybara_request
    page.driver.request.env['action_controller.instance'].request.filtered_parameters
  end
end
