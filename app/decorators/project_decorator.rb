#
# +ProjectDecorator+
# Encapsulates logic and rendering data for dynamic Project forms.
#
#

class ProjectDecorator < Draper::Decorator
  delegate_all

  def complete_form
    create_virtual_attributes_on_project

    h.form_for @object, builder: ProjectFormBuilder do |f|
      @object.fields.each do |field|
        if field.field_type != "select"
          h.haml_concat f.send("#{field.field_type}", field.attr_name)
        end
      end
    end
  end

  def process_field

  end

  def show_fields(builder)
    h.haml_concat "<br />".html_safe
    #@object.fields.each do |field|
    #  h.haml_concat h.raw builder.send(field.field_type.to_sym, field.name, field.name, "default value")
    #  h.haml_concat "<br />".html_safe
    #end
  end

  private

  # Important Note:  -------------------------------------------------------------------------------------------------
  #
  #   This private method 'monkey patches' the fields to be virtual attributes of the project so that they can be
  #   sent through a +form_for+ call
  #
  #   This is accomplished by collecting the project dynamic form fields in an array, then forcing them to
  #   be instance attributes of the Project class by passing each attribute through the +attr_accessor+ class
  #   method.
  #
  def create_virtual_attributes_on_project
    project_attributes = @object.project_type.fields_attributes_list
    @object.class_eval do
      attr_accessor *project_attributes
    end
  end

  # Custom form_builder methods

  def select(builder, label, attr, default)
    "f.select #{label}, #{attr}, #{default}"
  end

  def text_field(builder, label, attr, default)
    "f.text_field #{label} - #{attr} - #{default}"
  end

  def number_field(builder, label, attr, default)
    "f.number_field #{label} - #{attr} - #{default}"
  end

  def checkbox(builder, label, data, attr)
    "f.checkbox #{label} - #{attr} - #{data}"
  end

end
