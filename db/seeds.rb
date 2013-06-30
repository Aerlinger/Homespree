require File.expand_path('../seed_support/populate_users', __FILE__)
require File.expand_path('../seed_support/populate_projects', __FILE__)


### -----------------------------------------------------------------------------------------------------------------
# Database population:
### -----------------------------------------------------------------------------------------------------------------

puts "-- Seeding database in #{Rails.env} -- "

create_service_types
create_project_types
unless Rails.env.test?
  create_admins
end
create_default_contractors
create_default_homeowners
create_mailing_list_users

