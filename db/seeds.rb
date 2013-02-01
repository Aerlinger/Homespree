# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make sure we are always included in Email List

puts "Creating email list:"
EmailList.create!(email: "aerlinger@gmail.com", contractor: false)
EmailList.create!(email: "joe@myhomespree.com", contractor: false)
EmailList.create!(email: "kyle@myhomespree.com", contractor: false)