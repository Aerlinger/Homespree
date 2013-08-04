### ----------------------------------------------------------------------------------------------------------------
# +ProjectDecorator+
#   Decorator to encapsulates logic and rendering strategy for dynamic Project forms.
#
#   This class is a wrapper for both the Project model and ProjectFormBuilder
#
class ProjectDecorator < Draper::Decorator
  delegate_all

  ### --------------------------------------------------------------------------------------------------------------
  # Wrapper for custom form builder (ProjectFormBuilder)
  #
  # Delegates calls for building individual fields to the +process_field+
  # method.
  #
  #  Requires:
  #   - field_type (Symbol):
  #       (ex - :text_field, :check_box)
  #
  def dynamic_form_fields(builder)
    # Allow dynamic fields in our Project to be processed by form_for
    create_virtual_attributes!

    @object.fields.each do |field|
      h.haml_concat process_field(builder, field)
    end
  end

  private

  ### --------------------------------------------------------------------------------------------------------------
  # Passes dynamic field attributes to form builder:
  #
  #  Required Attributes:
  #   - field_name (Symbol):
  #       (ex - :wall_1, :wall_2)
  #   - field_type (Symbol):
  #       (ex - :text_field, :check_box)
  #
  #  Optional Attributes
  #   - field_data (Array/Hash):
  #       (ex - [:walls, :ceiling, :trim, :doors, :windows])
  #   - label (String)
  #       (ex - "Wall 1 (Square Feet)")
  #   - default (String/Boolean):
  #       (ex - "Wood", true)
  #   - required (True/False):
  #       True if this field is required
  #
  def process_field(builder, field)
    builder.send(field.field_type.to_sym,
                 field.field_name.to_sym,

                 # Homespree Project Type Optional params
                 {
                   label:      field.label,
                   data:       field.field_data,
                   default:    field.default,
                   required:   field.required,
                   position:   field.position,
                   size:       field.size,
                   toggleable: field.toggleable
                 }
    )
  end

  # Important Note:  -------------------------------------------------------------------------------------------------
  #
  #   This private method 'monkey patches' the fields to be virtual attributes of the project so that they can be
  #   sent through a +form_for+ call
  #
  #   This is accomplished by collecting the project dynamic form fields in an array, then forcing them to
  #   be instance attributes of the Project class by passing each attribute through the +attr_accessor+ class
  #   method.
  #
  def create_virtual_attributes!
    project_attributes = @object.project_type.fields_attributes_list
    @object.class_eval do
      attr_accessor *project_attributes
    end
  end
end
