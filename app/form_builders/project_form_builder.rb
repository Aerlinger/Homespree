class ProjectFormBuilder < ActionView::Helpers::FormBuilder

  %w[text_field check_box text_area collection_select select].each do |method_name|

    define_method(method_name) do |name, *args|
      @template.content_tag :div, class: "field" do
        label(name) + @template.tag(:br) + super(name, *args)
      end
    end

  end

  #def text_field(name, *args)
  #  @template.content_tag :div, class: "field" do
  #    label(name) + @template.tag(:br)
  #  end
  #end
  #
  #def select(name, *args)
  #
  #end
  #
  #def collection_select(name, *args)
  #
  #end

end