module ApplicationHelper

  def check_active(page_name)
    "active" if current_page? page_name
  end

end
