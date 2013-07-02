def create_default_contractors

  %w[joe jim jack james jake].each do |name|

    # Delete this contractor if it already exists:
    existing_contractor = Contractor.find_by_email("#{name}@seed.com")
    existing_contractor.destroy if existing_contractor

    contractor = Contractor.create! do |c|
      c.email    = "#{name}@seed.com"
      c.password = "iamsecret"

      c.first_name    = name
      c.last_name     = "Smith"
      c.company_title = "#{name}'s Most Excellent Contracting"

      c.bonding_limit   = 100.00
      c.insurance_limit = 200.00

      c.office_number = "7145559652"
      c.mobile_number = "9495556404"

      c.slogan = "Asdfjkl;"

      c.description = "Terrell Design & Development and the Golden Triangle Design Group is a full-service Design and General Contracting Consulting firm that specializes in new construction, as well as extensive remodels and additions. Over the past two decades, the Golden Triangle Design Group has become known for their ability to solve complex design issues, while implementing all of the clients needs and wants. By providing exceptional expertise and technical knowledge to every phase of the project, clients are able to rely on the GTDG to deliver a product unlike any other."

      c.facebook = "www.facebook.com/#{name}"
      c.twitter  = "@#{name}"
      c.license  = "ABCDEFG12345"

      c.website = "http://www.#{name}scontracting.com"

      specialties = ["Interior Painting", "Exterior Painting", "Power Washing", "Concrete Staining / Epoxy", "Faux Finishing"]

      specialties.collect.each do |specialty|
        c.specialties << Specialty.new(name: specialty)
      end

      address = Address.new do |a|
        a.line1   = "1234 Blue collar road"
        a.line2   = "4th Main Providence"
        a.state   = "NJ"
        a.zipcode = "12345"
        a.city    = "Trenton"
      end

      c.address = address
    end

    puts "Created contractor: #{contractor.first_name} #{contractor.last_name} - #{contractor.company_title}"
  end

end

def create_default_homeowners

  %w[betty bob bonnie beth beckie billy].each do |name|

    # Delete this homeowner if it already exists:
    existing_homeowner = Homeowner.find_by_email("#{name}@seed.com")
    existing_homeowner.destroy if existing_homeowner

    homeowner = Homeowner.create! do |h|
      h.email    = "#{name}@seed.com"
      h.password = "iamsecret"

      h.first_name = name
      h.last_name  = "Smith"

      h.office_number = "7145559652"

      h.address = Address.new do |a|
        a.line1   = "1234 Blue collar road"
        a.line2   = "4th Main Providence"
        a.state   = "NJ"
        a.zipcode = "12345"
        a.city    = "Trenton"
      end
    end

    puts "Created homeowner: #{homeowner.first_name} #{homeowner.last_name}"
  end
end


def create_mailing_list_users
  anthony_email = Mailinglist.find_or_create_by_email("aerlinger@gmail.com")
  joe_email     = Mailinglist.find_or_create_by_email("joe@myhomespree.com")
  kyle_email    = Mailinglist.find_or_create_by_email("kyle@myhomespree.com")

  [anthony_email, joe_email, kyle_email].each do |mailing_list|
    mailing_list.user_type = "homeowner"
  end

  puts "Created mailing users"
end


def create_admins
  puts "Creating admin users:"

  %w[admin anthony kyle joe].each do |name|
    AdminUser.find_or_create_by_email!("#{name}@myhomespree.com", password: "Meetmike9")
  end

  unless (User.find_by_email("admin@myhomespree.com"))
    contractor_admin = Contractor.create do |homespree_admin|
      homespree_admin.email         = "admin@myhomespree.com"
      homespree_admin.first_name    = "Homespree Admin"
      homespree_admin.password      = "Meetmike9"
      homespree_admin.company_title = "Homespree Admin"
    end

    puts "ADMIN contractor created: #{User.find_by_email("admin@myhomespree.com").email} id: #{contractor_admin.id}"
  end

end