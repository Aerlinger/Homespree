
anthony_email = Mailinglist.find_or_create_by_email("aerlinger@gmail.com")
joe_email = Mailinglist.find_or_create_by_email("joe@myhomespree.com")
kyle_email = Mailinglist.find_or_create_by_email("kyle@myhomespree.com")

[anthony_email, joe_email, kyle_email].each do |mailing_list|
  mailing_list.user_type = "homeowner"
end

AdminUser.find_or_create_by_email!('admin@myhomespree.com', password: "Meetmike9")
AdminUser.find_or_create_by_email!('anthony@myhomespree.com', password: "Meetmike9")
AdminUser.find_or_create_by_email!('kyle@myhomespree.com', password: "Meetmike9")
AdminUser.find_or_create_by_email!('joe@myhomespree.com', password: "Meetmike9")

puts "Creating admin users:"
puts AdminUser.all

# Create a default Contractor
if Contractor.exists?(1)
  Contractor.destroy(1)
end

joe_the_plumber = Contractor.new do |c|

  c.email = "joetheplumber@seed.com"
  c.password = "iamsecret"

  c.id = 1
  c.first_name = "joe"
  c.last_name = "Plumber"
  c.company_title = "Joe's Most Excellent Plumbing Services"

  c.bonding_limit = 100.00
  c.insurance_limit = 200.00

  c.office_number = "7145559652"
  c.mobile_number = "9495556404"

  c.slogan = "Where your shit's my problem."

  c.description = "A plumber is called to a house to repair a leaking pipe. When he arrives he is pleased to discover that the lady of the house is both beautiful and very friendly. One thing leads to another and the two end up in the bedroom. Suddenly the phone rings and the woman answers it. ‘That was my husband,’ she says when she puts down the receiver. ‘He’s on his way home, but he’s taking a flight out of town at eight. If you come back then we can take up where we left off.’ The plumber looks at the woman in disbelief. ‘What?’ he says. ‘On my own time?’"

  c.facebook = "www.facebook.com/joe_the_plumber"
  c.twitter = "@joe_the_plumber"
  c.license = "ABCDEFG12345"

  c.website = "http://www.joesplumbing.com"

  address = Address.new do |a|
    a.line1 = "1234 Blue collar road"
    a.line2 = "4th Main Providence"
    a.state = "NJ"
    a.zipcode = "12345"
    a.city = "Princeton"
  end

  c.addresses << address

end

joe_the_plumber.save!

puts "Created contractor: #{joe_the_plumber.company_title}"