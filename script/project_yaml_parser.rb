# Project Form Builder:  ------------------------------------------------------------------------------------
#
#   A very simple form builder Service Class for the project submission wizard.
#
# -----------------------------------------------------------------------------------------------------------


require 'psych'
require 'yaml'

module Homespree
  class HomespreeParser

    def initialize(yaml_data)
      @yaml_data = yaml_data
    end


    def dispatch(delegate, *methods)
    end

  end
end


def render_leaf_attribute(value, data_type)
  type_associations = {
    decimal:        :text_field,
    integer:        :number_field,
    string:         :text_field,
    text:           :text_field,
    boolean:        :checkbox,
    boolean_yes_no: "option_for_select[['Yes', true], ['No', false]]",
    array:          :options_for_select
  }

  #form_type = type_associations[data_type.to_sym]

  if data_type.is_a? String
    [:hs_field, value.to_sym, data_type]
  elsif data_type.is_a? Array
    [:hs_field, value.to_sym, data_type]
  elsif data_type.is_a? Hash
    puts "\t\tf.send(:#{type_associations[data_type]}) :#{value}"
  else
    raise TypeError.new("YAML file does not properly format type")
  end

  # Return Examples: [:hs_field, :feet, :decimal, {condition: "Check if needs paint"}]
  #                  [:hs_select_field, :feet, :decimal, {condition: "Check if needs paint"}]
  #                  [:hs_boolean_field, :feet, :decimal, {condition: "Check if needs paint"}]
end

# Three possibilities for a 'Leaf' node
#   Case 1: String:
#   Case 2: Array:
#   Case 3: Boolean:
#   - Array: (Collection field)
#   - Hash: (Single Input field)
#
def process_fields(fields)
  fields.each do |attribute, value|
    puts render_leaf_attribute(attribute, value)
  end
end


# Returns
#   method: e.g: [:hs_field, :hs_select_field, :hs_boolean_field]
#   method args as an array: e.g: ["Bifold", :quantity, :integer, condition: "Enabled"]
#
def dispatch(receiver, *args)

end

# Main:  --------------------------------------------------------------------------------------------------

form_data = YAML.load(File.read("../config/contractor_services/sample.yml"))

puts "YAML file read successfully"

service_type   = form_data['SERVICE_TYPE']
project        = form_data['PROJECT']
project_name   = project['NAME']
project_fields = project['FIELDS']


puts "-- #{service_type}: #{project_name} --"

process_fields(project_fields)