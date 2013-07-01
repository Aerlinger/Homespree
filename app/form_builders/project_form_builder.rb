### --------------------------------------------------------------------------------------------------------------
#
# Custom form builder for dynamic project fields
#
class ProjectFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(name, *args)
    options = args.extract_options!

    wrap_field(name) do
      super(name, *args)
    end
  end

  def number_field(name, *args)
    options = args.extract_options!

    wrap_field(name) do
      super(name, *args)
    end
  end

  def check_box(name, *args)
    options = args.extract_options!

    wrap_field(name) do
      super(name, *args)
    end
  end

  def select(name, *args)
    options = args.extract_options!

    wrap_field(name) do
      super(name, options[:data])
    end
  end


  def wrap_field(name, *args, &block)
    return_str = ""

    @template.content_tag :div, class: "field" do
      return_str = label(name)
      if block_given?
        return_str << yield
      end
    end
  end

end