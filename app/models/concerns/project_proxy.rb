module ProjectForm
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def collect_fields_from_project_type
      project_type.fields.each do |field|
        attr = "adsf"
      end
    end
  end
end