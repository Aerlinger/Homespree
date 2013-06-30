class ProjectDecorator < Draper::Decorator
  delegate_all

  def complete_form

  end

  def process_field
    @object.fields.each do |field|
      self.send(field.field_type.to_sym, field.name, "default value")
    end
  end

  def create_virtual_attribute_on_project

  end

  private

  def select(label, attr, default)
  end

  def text_field(label, attr, default)
  end

  def number_field(label, attr, default)
  end

  def checkbox(label, data, attr)
  end

end
