puts "Creating email list:"

anthony_email = Mailinglist.find_or_create_by_email("aerlinger@gmail.com")
joe_email = Mailinglist.find_or_create_by_email("joe@myhomespree.com")
kyle_email = Mailinglist.find_or_create_by_email("kyle@myhomespree.com")

[anthony_email, joe_email, kyle_email].each do |mailing_list|
  mailing_list.user_type = "homeowner"
end

admin_user = AdminUser.find_or_create_by_email('admin@myhomespree.com')
anthony_user = AdminUser.find_or_create_by_email('anthony@myhomespree.com')
kyle_user = AdminUser.find_or_create_by_email('kyle@myhomespree.com')
joe_user = AdminUser.find_or_create_by_email('joe@myhomespree.com')

[admin_user, anthony_user, kyle_user, joe_user].each do |admin|
  admin.password = "MeetMike9"
end

# Create a default Contractor

joe_the_plumber = Contractor.new(email: "joetheplumber@test.com", password: "iamsecret", password_confirmation: "iamsecret")
joe_the_plumber.name = "joe"
joe_the_plumber.name = "the plumber"

