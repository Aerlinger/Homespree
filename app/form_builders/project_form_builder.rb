### --------------------------------------------------------------------------------------------------------------
#
# Custom form builder for dynamic project fields
#
class ProjectFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(name, *args)
    return_html = wrap_field(name, *args) do
      super(name, *args)
    end

    return_html << "<br />".html_safe
  end

  def number_field(name, *args)
    wrap_field(name, *args) do
      super(name, *args)
    end
  end

  def check_box(name, *args)
    wrap_field(name, *args) do
      super(name, *args)
    end
  end

  def select(name, *args)
    wrap_field(name, *args) do
      super(name, *args)
    end
  end


  def wrap_field(name, *args, &block)
    options = args.extract_options!

    css_align = options[:position] == "right" ? "pull-right" : ""
    css_input_size = options[:size]

    options[:value] = options[:default]
    toggleable = options[:toggleable]

    return_str = ""
    @template.content_tag :div, class: "field #{css_align}" do
      return_str = label(options[:label] || name)

      if block_given?
        return_str << yield
      end

      #if toggleable
      #  return_str << label("Enable check box")
      #end
    end
  end

end