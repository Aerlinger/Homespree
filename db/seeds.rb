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
                                                                                                    

HOMESPREE

puts "GREAT SUCCESS!!"