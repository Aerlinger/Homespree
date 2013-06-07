
anthony_email = Mailinglist.find_or_create_by_email("aerlinger@gmail.com")
joe_email = Mailinglist.find_or_create_by_email("joe@myhomespree.com")
kyle_email = Mailinglist.find_or_create_by_email("kyle@myhomespree.com")

[anthony_email, joe_email, kyle_email].each do |mailing_list|
  mailing_list.user_type = "homeowner"
end

puts "Creating admin users:"
AdminUser.find_or_create_by_email!('admin@myhomespree.com', password: "Meetmike9")
AdminUser.find_or_create_by_email!('anthony@myhomespree.com', password: "Meetmike9")
AdminUser.find_or_create_by_email!('kyle@myhomespree.com', password: "Meetmike9")
AdminUser.find_or_create_by_email!('joe@myhomespree.com', password: "Meetmike9")

puts "Success!"
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
  c.company_title = "Joe's Most Excellent Plumbing"

  c.bonding_limit = 100.00
  c.insurance_limit = 200.00

  c.office_number = "7145559652"
  c.mobile_number = "9495556404"

  c.slogan = "Asdfjkl;"

  c.description = "Terrell Design & Development and the Golden Triangle Design Group is a full-service Design and General Contracting Consulting firm that specializes in new construction, as well as extensive remodels and additions. Over the past two decades, the Golden Triangle Design Group has become known for their ability to solve complex design issues, while implementing all of the clients needs and wants. By providing exceptional expertise and technical knowledge to every phase of the project, clients are able to rely on the GTDG to deliver a product unlike any other."

  c.facebook = "www.facebook.com/joe_the_plumber"
  c.twitter = "@joe_the_plumber"
  c.license = "ABCDEFG12345"

  c.website = "http://www.joesplumbing.com"

  specialties = ["Interior Painting", "Exterior Painting", "Power Washing", "Concrete Staining / Epoxy", "Faux Finishing"]
  specialties.collect.each do |specialty|
    c.specialties << Specialty.new(name: specialty)
  end

  address = Address.new do |a|
    a.line1 = "1234 Blue collar road"
    a.line2 = "4th Main Providence"
    a.state = "NJ"
    a.zipcode = "12345"
    a.city = "Princeton"
  end

  #(1..6).each do |photo_id|
  #  photo = Photo.create! do |p|
  #    p.image_url = "#{photo_id}.jpg"
  #  end
  #
  #  c.photos << photo
  #end

  c.address = address
end

joe_the_plumber.save!

puts "Created contractor: #{joe_the_plumber.company_title}"