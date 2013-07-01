require 'active_record'

namespace :homespree do

  desc "List all service types"
  task :service_types => :environment do
    puts "-- SERVICE TYPES --"
    puts ServiceType.all
  end

  desc "List all project types"
  task :project_types => :environment do
    puts "-- PROJECT TYPES --"
    puts ProjectType.all
  end

  desc "Repopulate Service Types in database"
  task :load_project_types => :environment do

  end

end

namespace :db do

  task :seed => :environment do

    puts "Creating Project Categories"

    puts <<-HOMESPREE


                                           ::/++++++/           /++++++++++:
                                     :/+shdmNNMMMMMMd          :NMMMMMMMMMM+
                                 :/ohmNMMMMMMMMMMMMMo          sMMMMMMMMMMm
                               /sdNMMMNmmMMMMMMMMMMm:         :mMMMMMMMMMMs
                            :odNMMMMmy+:dMMMMMMMMMMy          oMMMMMMMMMMN:
                          :omMMMMMm+:  /MMMMMMMMMMM/          dMMMMMMMMMMh
                         /dMMMMMNs:    yMMMMMMMMMMh          +NMMMMMMMMMN+
                        +NMMMMMN+     :NMMMMMMMMMM+          yMMMMMMMMMMd
                       +NMMMMMMo      oMMMMMMMMMMN          :NMMMMMMMMMMo
                      :mMMMMMMh      :dMMMMMMMMMMs          sMMMMMMMMMMm:
                      /MMMMMMMo      +MMMMMMMMMMN:          mMMMMMMMMMMy
                      /MMMMMMM:      hMMMMMMMMMMh          +MMMMMMMMMMN:
                      :mMMMMMM      /NMMMMMMMMMMhssssssssssdMMMMMMMMMMh
                       /mMMMMM+     sMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+
                         +yhmmd     NMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm
                                   oMMMMMMMMMMNysssssssssyNMMMMMMMMMMo
                                   dMMMMMMMMMMy          +MMMMMMMMMMN:
                                  /MMMMMMMMMMM:          dMMMMMMMMMMy
                                  yMMMMMMMMMMh          /NMMMMMMMMMN/
                                 :NMMMMMMMMMM+          yMMMMMMMMMMd
                                 sMMMMMMMMMMN          :NMMMMMMMMMM+
                                -dMMMMMMMMMMs          oMMMMMMMMMMm:
                                +MMMMMMMMMMN:          mMMMMMMMMMMs
                               -hMMMMMMMMMMh          /MMMMMMMMMMN:
                               /NMMMMMMMMMN+         -hMMMMMMMMMMh-
                               yMMMMMMMMMMd-         :NMMMMMMMMMM/
                              -NMMMMMMMMMMo          sMMMMMMMMMMm
                              oMMMMMMMMMMm:         :mMMMMMMMMMMo
                              mMMMMMMMMMMy          +MMMMMMMMMMN-
                             /MMMMMMMMMMN:         -dMMMMMMMMMMy
                             :///////////-         -///////////-



                 -----------------------------
                   Populating project fields
                 -----------------------------

    HOMESPREE

    service_types = YAML.load(File.read("config/contractor_services/project_fields.yml"))

    ServiceType.destroy_all
    ProjectType.destroy_all
    ProjectField.destroy_all

    # For each SERVICE Type:  -----------------------------------------------------------------------------------------------
    service_types.each do |service_type, project_types|
      st = ServiceType.create name: service_type
      puts "Creating Service Type: #{st}"

      # For each PROJECT Type:  ---------------------------------------------------------------------------------------------
      project_types.each do |project_type, project_fields|
        pt = ProjectType.create name: project_type
        puts "\tCreating Project Type: #{pt}"

        st.project_types << pt

        # For each PROJECT FIELD:  ------------------------------------------------------------------------------------------
        project_fields.each do |project_field_name, project_field_attrs|
          pf = ProjectField.create do |p|
            p.attr_name   = project_field_name

            p.label       = project_field_attrs["label"]        if project_field_attrs["label"]
            p.default     = project_field_attrs["default"]      if project_field_attrs["default"]
            p.size        = project_field_attrs["size"]         if project_field_attrs["size"]
            p.position    = project_field_attrs["position"]     if project_field_attrs["position"]
            p.toggleable  = project_field_attrs["toggleable"]   if project_field_attrs["toggleable"]
            p.name        = project_field_attrs["name"]         if project_field_attrs["name"]
            p.required    = project_field_attrs["required"]     if project_field_attrs["required"]
            p.field_type  = project_field_attrs["field_type"]   if project_field_attrs["field_type"]
            p.field_data  = project_field_attrs["field_data"]   if project_field_attrs["field_data"]
          end

          pt.fields << pf

          puts "\t\t#{pf}"

          pt = ProjectType.create name: project_type
        end
      end
    end

    puts "Finished creating Project Fields!"
  end

end
