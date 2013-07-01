require 'active_record'

namespace :homespree do

  desc "List all service types"
  task :service_types => :environment do
    puts ServiceType.all
  end

  desc "List all project types"
  task :project_types => :environment do
    puts ProjectType.all
  end

  desc "Repopulate Service Types in database"
  task :project_types => :environment do
    puts "NYI"
  end

  desc "Repopulate Project Types in database"
  task :project_types => :environment do
    puts "NYI"
  end

end