def create_service_types
  ServiceType.destroy_all
  ServiceType.find_or_create_by_name("Painting")
end

def populate_interior_painting_fields(interior_painting)
  interior_painting.fields.destroy_all

  interior_painting.fields << ProjectField.create(field_type: :text_field, name: "Wall 1", required: true)
  interior_painting.fields << ProjectField.create(field_type: :text_field, name: "Wall 2", required: true)
  interior_painting.fields << ProjectField.create(field_type: :text_field, name: "Wall 3", required: true)
  interior_painting.fields << ProjectField.create(field_type: :text_field, name: "Wall 4", required: true)

  interior_painting.fields << ProjectField.create(field_type: :select, name: "Surfaces", field_data: [:walls, :ceiling, :trim, :doors, :windows], required: true)

  interior_painting.fields << ProjectField.create(field_type: :number_field, name: "Flat #")
  interior_painting.fields << ProjectField.create(field_type: :checkbox, name: "Flat")
end

def create_project_types
  painting_service = ServiceType.find_by_name("Painting")

  ProjectField.destroy_all
  ProjectType.destroy_all

  project_types = [
    interior_painting   = ProjectType.find_or_create_by_name("Interior Painting"),
    exterior_painting   = ProjectType.find_or_create_by_name("Exterior Painting"),
    wallpaper           = ProjectType.find_or_create_by_name("Wallpaper"),
    faux_painting       = ProjectType.find_or_create_by_name("Faux Painting"),
    concrete            = ProjectType.find_or_create_by_name("Concrete"),
    deck                = ProjectType.find_or_create_by_name("Deck"),
    fence               = ProjectType.find_or_create_by_name("Fence"),
    faux_finish         = ProjectType.find_or_create_by_name("Faux Finish"),
    wood_floor_painting = ProjectType.find_or_create_by_name("Wood Floor Painting"),
    powerwashing        = ProjectType.find_or_create_by_name("Powerwashing"),
    windows             = ProjectType.find_or_create_by_name("Windows"),
    doors               = ProjectType.find_or_create_by_name("Doors"),
  ]

  populate_interior_painting_fields(interior_painting)

  painting_service.project_types << interior_painting
  painting_service.project_types << exterior_painting

  puts interior_painting
  #puts "Interior painting fields: " + interior_painting.fields

  puts exterior_painting
  #puts "Exterior painting fields: " + exterior_painting.fields
end