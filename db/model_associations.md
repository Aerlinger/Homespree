#Category Objects:
##ServiceType (Painting, Roofing)
  ##ProjectType (static)
    - has many ProjectFields (text field, check_box)
      >> View layer: [AJAX]
  
  #Project (Instance of ProjectType)
    belongs_to :service_type, through: :project_type
    belongs_to :project_type
    belongs_to :contractor
    belongs_to :homeowner
    has_many: :appointments
    has_one: :address
   
  User:
    has_many :projects
    has_many :appointments, through: projects
    has_one :address

    Homeowner:
      has_many :contractors, through: projects

    Contractor:
      has_many :homeowners, through: projects
      has_many :specialties, through: projects
