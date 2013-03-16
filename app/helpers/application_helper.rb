module ApplicationHelper

  def check_active(page_name)
    "active" if current_page? page_name
  end

  def present(object, klass=nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)

    yield presenter if block_given?
    presenter
  end

end
