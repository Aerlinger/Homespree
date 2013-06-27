# Helpers:  -----------------------------------------------------------------------------------------------

require 'psych'
require 'yaml'


# Recursively crawls field attributes to extract a tree representing nested form data
def render_leaf_attribute(value, type)
  type_associations = {
    decimal:        :text_field,
    integer:        :number_field,
    string:         :text_field,
    text:           :text_field,
    boolean:        :checkbox,
    boolean_yes_no: "option_for_select[['Yes', true], ['No', false]]",
    # uses option_for_select option text (city name) and option value (city id)
    array:          :options_for_select
  }

  if type.is_a? String
    puts "\t\tf.send(:#{type_associations[type.to_sym]}) :#{value}"
  else
    puts "\t\tf.send(:select) :#{type}"
  end
end

def process_fields(fields, form_data = {})

  # Three possibilities
  #   - String: ('Leaf' node for single input field)
  #   - Array: (Collection field)
  #   - Hash: (Single Input field)
  if fields.is_a? Hash
    fields.each do |attribute, value|
      #puts "\t >> #{attribute}: #{value}"
      if value.is_a? Hash
        process_fields(attribute)
      else
        render_leaf_attribute(attribute, value)
      end
    end
  end
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
