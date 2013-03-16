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
#Contractor.destroy(1)

joe_the_plumber = Contractor.new(email: "joetheplumber@seed.com", password: "iamsecret", password_confirmation: "iamsecret")

joe_the_plumber.id = 1
joe_the_plumber.first_name = "joe"
joe_the_plumber.last_name = "the plumber"
joe_the_plumber.title = "Joe's Plumbing"

joe_the_plumber.bonding_limit = 100.00
joe_the_plumber.insurance_limit = 200.00

joe_the_plumber.office_number = "(714)-555-9652"
joe_the_plumber.mobile_number = "(949)-555-6404"

joe_the_plumber.description = Faker::Lorem.paragraphs(2)

joe_the_plumber.facebook = "www.facebook.com/joe_the_plumber"
joe_the_plumber.twitter = "@joe_the_plumber"
joe_the_plumber.license = "ABCDEFG12345"

joe_the_plumber.filename = "default.jpg"

joe_the_plumber.save(validate: false)