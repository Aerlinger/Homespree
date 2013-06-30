def create_service_types
  ServiceType.destroy_all
  ServiceType.find_or_create_by_name("Painting")
end

def create_project_types
  painting_service = ServiceType.find_by_name("Painting")

  interior_painting = ProjectType.find_or_create_by_name("Interior Painting")
  exterior_painting = ProjectType.find_or_create_by_name("Exterior Painting")

  interior_painting_fields = []
  interior_painting_fields << ProjectField.create(field_type: :text_field, name: "Wall 1", required: true)
  interior_painting_fields << ProjectField.create(field_type: :text_field, name: "Wall 2", required: true)
  interior_painting_fields << ProjectField.create(field_type: :text_field, name: "Wall 3", required: true)
  interior_painting_fields << ProjectField.create(field_type: :text_field, name: "Wall 4", required: true)

  interior_painting.fields << interior_painting_fields

  painting_service.project_types << interior_painting
  painting_service.project_types << exterior_painting

  puts interior_painting
  puts exterior_painting
end