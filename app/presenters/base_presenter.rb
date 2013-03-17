class BasePresenter

  def initialize(object, template)
    @object = object
    @template = template
  end

  protected

  def handle_none(value, replacement="")
    if value.present?
      return yield if block_given?
      value
    else
      h.content_tag :span, replacement, class: "empty"
    end
  end

  private

  def self.presents(name)
    define_method(name) do
      @object
    end
  end

  def h
    @template
  end

  # We want to delegate all calls to the template to allow the Presenter to emulate the view
  def method_missing(*args, &block)
    @template.send(*args, &block)
  end

  def markdown(text)
    Redcarpet.new(text, :hard_wrap, :filter_html, :autolink).to_html.html_safe
  end

end