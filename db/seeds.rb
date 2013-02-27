puts "Creating email list:"

Mailinglist.create!(email: "aerlinger@gmail.com", user_type: "Homeowner")
Mailinglist.create!(email: "joe@myhomespree.com", user_type: "Homeowner")
Mailinglist.create!(email: "kyle@myhomespree.com", user_type: "Homeowner")

AdminUser.create!(:email => 'admin@myhomespree.com', :password => 'Meetmike9', :password_confirmation => 'Meetmike9')
AdminUser.create!(:email => 'anthony@myhomespree.com', :password => 'Meetmike9', :password_confirmation => 'Meetmike9')
AdminUser.create!(:email => 'kyle@myhomespree.com', :password => 'Meetmike9', :password_confirmation => 'Meetmike9')
AdminUser.create!(:email => 'joe@myhomespree.com', :password => 'Meetmike9', :password_confirmation => 'Meetmike9')


# Create a default Contractor

joe = Contractor.new

